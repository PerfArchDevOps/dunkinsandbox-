view: pos_subcat_by_wk_dayprt_grp_f {
  sql_table_name: BAL3.POS_SUBCAT_BY_WK_DAYPRT_GRP_F ;;

  dimension: dwh_dayprt_grp_id {
    type: number
    hidden: yes  sql: ${TABLE}.DWH_DAYPRT_GRP_ID ;;
  }

  dimension: dwh_item_sub_catgry_id {
    type: number
    hidden: yes  sql: ${TABLE}.DWH_ITEM_SUB_CATGRY_ID ;;
  }

  dimension: dwh_pos_ordr_type_id {
    type: number
    hidden: yes  sql: ${TABLE}.DWH_POS_ORDR_TYPE_ID ;;
  }

  dimension: dwh_shop_brand_id {
    type: number
    hidden: yes  sql: ${TABLE}.DWH_SHOP_BRAND_ID ;;
  }

  dimension: dwh_shop_rooftp_id {
    type: number
    hidden: yes  sql: ${TABLE}.DWH_SHOP_ROOFTP_ID ;;
  }
  dimension: net_sales_amt {
    type: number
    hidden: yes  sql: ${TABLE}.NET_SALES_AMT ;;
  }

  dimension: net_sales_amt_ly {
    type: number
    hidden: yes  sql: ${TABLE}.NET_SALES_AMT_LY ;;
  }

  dimension_group: transctn_bus {
    type: time
    timeframes: [
      raw,
      date
    ]
    convert_tz: no
    datatype: date
    hidden: yes  sql: ${TABLE}.TRANSCTN_BUS_DATE ;;
  }

  dimension: yoy_sales_week_ind {
    type: string
    hidden: yes  sql: ${TABLE}.YOY_SALES_WEEK_IND ;;
  }

  measure: count {
    type: count
  }
}
