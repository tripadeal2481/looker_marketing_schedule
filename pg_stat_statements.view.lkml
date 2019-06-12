view: pg_stat_statements {
  sql_table_name: public.pg_stat_statements ;;

  dimension: blk_read_time {
    type: number
    sql: ${TABLE}."blk_read_time" ;;
  }

  dimension: blk_write_time {
    type: number
    sql: ${TABLE}."blk_write_time" ;;
  }

  dimension: calls {
    type: number
    sql: ${TABLE}."calls" ;;
  }

  dimension: dbid {
    type: string
    sql: ${TABLE}."dbid" ;;
  }

  dimension: local_blks_dirtied {
    type: number
    sql: ${TABLE}."local_blks_dirtied" ;;
  }

  dimension: local_blks_hit {
    type: number
    sql: ${TABLE}."local_blks_hit" ;;
  }

  dimension: local_blks_read {
    type: number
    sql: ${TABLE}."local_blks_read" ;;
  }

  dimension: local_blks_written {
    type: number
    sql: ${TABLE}."local_blks_written" ;;
  }

  dimension: max_time {
    type: number
    sql: ${TABLE}."max_time" ;;
  }

  dimension: mean_time {
    type: number
    sql: ${TABLE}."mean_time" ;;
  }

  dimension: min_time {
    type: number
    sql: ${TABLE}."min_time" ;;
  }

  dimension: query {
    type: string
    sql: ${TABLE}."query" ;;
  }

  dimension: queryid {
    type: number
    value_format_name: id
    sql: ${TABLE}."queryid" ;;
  }

  dimension: rows {
    type: number
    sql: ${TABLE}."rows" ;;
  }

  dimension: shared_blks_dirtied {
    type: number
    sql: ${TABLE}."shared_blks_dirtied" ;;
  }

  dimension: shared_blks_hit {
    type: number
    sql: ${TABLE}."shared_blks_hit" ;;
  }

  dimension: shared_blks_read {
    type: number
    sql: ${TABLE}."shared_blks_read" ;;
  }

  dimension: shared_blks_written {
    type: number
    sql: ${TABLE}."shared_blks_written" ;;
  }

  dimension: stddev_time {
    type: number
    sql: ${TABLE}."stddev_time" ;;
  }

  dimension: temp_blks_read {
    type: number
    sql: ${TABLE}."temp_blks_read" ;;
  }

  dimension: temp_blks_written {
    type: number
    sql: ${TABLE}."temp_blks_written" ;;
  }

  dimension: total_time {
    type: number
    sql: ${TABLE}."total_time" ;;
  }

  dimension: userid {
    type: string
    sql: ${TABLE}."userid" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
