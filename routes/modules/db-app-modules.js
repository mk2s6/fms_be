const { moduleModes } = require('../../model/constant');

const fileName = (str) => `*** FILE: db-app-modules ; FUNCTION:  ${str ? `|| ${str}` : ''} ***`;

async function getModules(log, pool, authed) {
  log.info(fileName('getModules'));
  return pool.execute(
    `SELECT
            module_id AS id, module_code AS code, module_name AS module, module_display_name AS label,
            module_description AS description, module_icon AS icon, module_route as route, module_is_sub_module isSubModule,
            module_parent_module AS isParentModule, module_sort_order AS sort
    FROM modules
    WHERE module_status = ? AND (module_require_auth = ? OR module_code = 'MOD404')
    ORDER BY module_sort_order ASC;
  `,
    [1, authed],
  );
}

module.exports = { getModules };
