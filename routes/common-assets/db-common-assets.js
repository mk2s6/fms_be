const pool = require('../../database/db');
const { getCurrencyCodes, getCountries, getCountryStates, getCities } = require('../../model/api-service');

async function selectCountries() {
  return pool.execute('SELECT GROUP_CONCAT(country) AS countries FROM country');
}

async function selectStates({ country }) {
  return pool.execute('SELECT GROUP_CONCAT(state) AS states FROM state WHERE country = ?', [country]);
}

async function selectCities({ state }) {
  return pool.execute('SELECT GROUP_CONCAT(city) AS cities FROM city WHERE state = ?', [state]);
}

async function selectCurrencyCodes({ country = null }) {
  return pool.execute('SELECT currency_code AS currency, country FROM currency_codes WHERE CASE WHEN ? != "null" THEN cc_country = ? ELSE true;', [country, country]);
}

async function selectAllCurrencyCodes() {
  return pool.execute('SELECT currency_code AS currency, country FROM country WHERE currency_code IS NOT NULL;');
}

async function populateCountries() {
  const data = await getCountries();

  const Q = `
              INSERT INTO country (country, dialCode, flagurl, currency_code)
              VALUES
            `;
  const P = [];
  const E = [];
  data.forEach((C) => {
    E.push(`(?, ?, ?, ?)`);
    P.push(C.name, C.dialCode?.replace(' and ', '|#|') || null, C.flag || null, C.currency || null);
  });
  await pool.execute(`${Q} ${E.join(', ')};`, P);
}
async function populateCountryStates() {
  const data = await getCountryStates();
  const Q = `
              INSERT INTO state (state, country)
              VALUES
            `;
  const P = [];
  const E = [];
  data.forEach((C) => {
    C.states.forEach((S) => {
      E.push(`(?, ?)`);
      P.push(S.name, C.name);
    });
  });
  await pool.execute(`${Q} ${E.join(', ')};`, P);
}

async function populateCities() {
  const [states] = await selectAllStates();

  const Q = `
              INSERT INTO city (city, state, country)
              VALUES
            `;

  await Promise.all(
    states.map(async ({ state, country }) => {
      try {
        const data = await getCities(country, state);

        const P = [];
        const E = [];

        data?.forEach(async (C) => {
          E.push(`(?, ?, ?)`);
          P.push(C, state, country);
        });

        await pool.execute(`${Q} ${E.join(',')};`, P);
      } catch (e) {
        console.log(e.message);
      }
    }),
  );
}

async function populateGeoGraphicData() {
  // try {
  //   await populateCountries();
  // } catch (e) { }

  // try {
  //   await populateCountryStates();
  // } catch (e) {
  //   console.log("State error  ", e.message);
  // }

  try {
    await populateCities();
  } catch (e) {
    console.log('City error ', e);
  }

  return [];
}

async function selectPaymentModes() {
  return pool.execute('SELECT GROUP_CONCAT(transaction_mode) AS modes FROM transaction_modes', [1]);
}

async function selectTransactionCategories() {
  return pool.execute('SELECT GROUP_CONCAT(trans_category) AS modes FROM transaction_categories', [1]);
}

module.exports = {
  selectCountries,
  selectStates,
  selectCities,
  selectCurrencyCodes,
  selectPaymentModes,
  selectTransactionCategories,
  populateGeoGraphicData,
  selectAllCurrencyCodes,
};
