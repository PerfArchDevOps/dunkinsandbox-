view: ovride_comp_day {
  label: "Dim - Ovride Comp Day"
  sql_table_name: BAL3.OVRIDE_COMP_DAY;;

  dimension: dwh_shop_brand_id {
    type: number
    sql: ${TABLE}.dwh_shop_brand_id ;;
  }

  dimension: ovride_comp_day_ind {
    type: number
    sql: ${TABLE}.OVRIDE_COMP_DAY_IND ;;
  }

  dimension_group: ovride_comp_date {
    type: time
    timeframes: [
      raw,
      date
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.OVRIDE_COMP_DATE;;
  }

}
