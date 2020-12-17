connection: "dbm01p"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project

access_grant: access_grant_rls_dd_operations {
# Equivalent to OBIEE RLS DD Operations application role
 user_attribute: rls_dd_operations
  allowed_values: [ "yes" ]
}


explore: shop_d

{
always_join: [dbi_bi_user_access]

    join: dbi_bi_user_access
    {
    type: inner
    relationship: many_to_one
    required_access_grants: [access_grant_rls_dd_operations]
    sql_on: ${dbi_bi_user_access.hier_level_value} = ${shop_d.sl_vp_pyrmd_sl_vp_name}
       and ${dbi_bi_user_access.hierarchy_name} = 'DD Operations'
       and ${dbi_bi_user_access.dbi_user} = '{{ _user_attributes['rls_username'] }}';;
    }

}


explore: agg_pos_item {
  join: dates { type:inner
    relationship: many_to_one
    sql_on: ${agg_pos_item.transctn_bus_raw} = ${dates.actual_date_raw} ;;
    }


}

explore: dates {

  join: init_block_dates {
    type: full_outer
    relationship: many_to_many
    sql_on: 1=1 ;;
  }
}
