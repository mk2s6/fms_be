const axios = require('axios');

const request = axios.create({ timeout: 1500000 });

async function APIRequest({ url, method, body, customHeaders = null, ...opts }) {
    return request({
        url,
        method,
        data: body,
        ...(customHeaders ? { headers: customHeaders } : {}),
    });
}

async function getCurrencyCodes() {
    const data = await APIRequest({
        url: 'https://countriesnow.space/api/v0.1/countries/currency',
        method: 'get',
    });
    return data.data;
}

async function getCountries() {
    const data = await APIRequest({
        url: 'https://countriesnow.space/api/v0.1/countries/info?returns=currency,flag,unicodeFlag,dialCode,iso3',
        method: 'get',
    });
    return data.data.data;
}

async function getCountryStates() {
    const data = await APIRequest({
        url: 'https://countriesnow.space/api/v0.1/countries/states',
        method: 'get',
    });
    return data.data.data;
}

function getCities(country, state) {

    return new Promise(async (resolve, reject) => {
        const opts = {
            url: `https://countriesnow.space/api/v0.1/countries/state/cities/q?country=${country}&state=${state}`,
            method: 'get',
        }

        const response = await APIRequest(opts);

        return resolve(response.data.data)
    })

}

module.exports = APIRequest;
module.exports = {
    getCurrencyCodes,
    getCountries,
    getCountryStates,
    getCities,
};
