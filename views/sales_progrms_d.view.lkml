view: sales_progrms_d {
  sql_table_name: BAL3.SALES_PROGRMS_D ;;

  label: "Dim - Sales Programs"

   dimension: dwh_shop_brand_id {
    type: number
    hidden: yes sql: ${TABLE}.DWH_SHOP_BRAND_ID ;;
  }

  dimension: dwh_shop_rooftp_id {
    type: number
    hidden: yes
    sql: ${TABLE}.DWH_SHOP_ROOFTP_ID ;;
  }

  dimension_group: end {
    type: time
    timeframes: [
      raw,
      date
    ]
    convert_tz: no
    datatype: date
    hidden: no
    label: "Sales Program Effective End Date"
    sql: ${TABLE}.END_DATE ;;
  }

  dimension: sales_progrm_name {
    type: string
    hidden: no
    label: "Sales Program Name"
    sql: ${TABLE}.SALES_PROGRM_NAME ;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      date
    ]
    convert_tz: no
    datatype: date
    hidden: no
    label: "Sales Program Effective Start Date"
    sql: ${TABLE}.START_DATE ;;
  }

  dimension: status_ind {
    type: string
    hidden: no
    label: "Sales Program Effective Flag"
    sql: ${TABLE}.STATUS_IND ;;
  }

}
