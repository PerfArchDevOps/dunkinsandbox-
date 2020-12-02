connection: "dbm01p"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project


access_grant: access_grant_rls_dd_operations {
  user_attribute: rls_dd_operations
  allowed_values: [ "yes" ]
}


explore: shop_d

{

    join: dbi_bi_user_access
    {
    type: inner
    relationship: many_to_one
    required_access_grants: [access_grant_rls_dd_operations]
    sql_on: ${dbi_bi_user_access.hier_level_value} = ${shop_d.sl_vp_pyrmd_sl_vp_name} ;;
    }

}
