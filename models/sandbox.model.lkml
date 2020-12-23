connection: "dbm01p"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project

access_grant: access_grant_rls_dd_operations {
# Equivalent to OBIEE RLS DD Operations application role
 user_attribute: rls_dd_operations
  allowed_values: [ "yes" ]
}

explore: pos_check_by_week_f {
  label: "Fact - POS Check by Week"
  join: dates_week {
    relationship: many_to_one
    type: inner
    sql_on: ${pos_check_by_week_f.transctn_bus_raw}
      = ${dates_week.week_ending_raw} ;;
  }

  join: shop_addtnl_attrbts_d {
    relationship: many_to_one
    type: inner
    sql_on: ${pos_check_by_week_f.dwh_shop_brand_id} = ${shop_addtnl_attrbts_d.dwh_shop_brand_id} ;;
  }

  join: shop_brand_mastr_d{
    relationship: many_to_one
    type: inner
    sql_on: ${pos_check_by_week_f.dwh_shop_brand_id} = ${shop_brand_mastr_d.dwh_shop_brand_id} ;;
  }

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

  join: dates {
    type:inner
    relationship: many_to_one
    sql_on: ${agg_pos_item.transctn_bus_raw} = ${dates.actual_date_raw} ;;
    }

  join: dates_week {
    type: inner
    relationship: many_to_one
    sql_on: ${agg_pos_item.transctn_bus_week_raw} = ${dates_week.week_ending_raw} ;;
}

}

explore: dates {

  join: init_block_dates {
    type: full_outer
    relationship: many_to_many
    sql_on: 1=1 ;;
  }
}
