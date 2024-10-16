view: ingestion_metrics {
  sql_table_name: `@{INGESTION_METRICS}`
    ;;

  dimension: bucketer_growth_factor {
    type: number
    sql: ${TABLE}.bucketer_growth_factor ;;
  }

  dimension: bucketer_lower_bounds {
    hidden: yes
    sql: ${TABLE}.bucketer_lower_bounds ;;
  }

  dimension: bucketer_num_finite_buckets {
    type: number
    sql: ${TABLE}.bucketer_num_finite_buckets ;;
  }

  dimension: bucketer_scale_factor {
    type: number
    sql: ${TABLE}.bucketer_scale_factor ;;
  }

  dimension: bucketer_width {
    type: number
    sql: ${TABLE}.bucketer_width ;;
  }

  dimension: buckets {
    hidden: yes
    sql: ${TABLE}.buckets ;;
  }

  dimension: collector_id {
    type: string
    sql: ${TABLE}.collector_id ;;
  }

  dimension: component {
    type: string
    sql: ${TABLE}.component ;;
  }

  dimension: drop_count {
    type: number
    sql: ${TABLE}.drop_count ;;
  }

  dimension: drop_reason_code {
    type: string
    sql: ${TABLE}.drop_reason_code ;;
  }

  dimension_group: end {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      hour,
      minute,
      year
    ]
    datatype: epoch
    sql: UNIX_SECONDS(${TABLE}.end_time) ;;
  }

  dimension: error_code {
    type: string
    sql: ${TABLE}.error_code ;;
  }

  dimension: event_count {
    type: number
    sql: ${TABLE}.event_count ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.event_type ;;
  }

  dimension: feed_id {
    type: string
    sql: ${TABLE}.feed_id ;;
  }

  dimension: input_type {
    type: string
    sql: ${TABLE}.input_type ;;
  }

  dimension_group: last_heartbeat {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_heartbeat_time ;;
  }

  dimension: latency_count {
    type: number
    sql: ${TABLE}.latency_count ;;
  }

  dimension: latency_overflow {
    type: number
    sql: ${TABLE}.latency_overflow ;;
  }

  # dimension: latency_time_milliseconds {
  #   type: number
  #   sql: ${TABLE}.latency_time_milliseconds ;;
  # }

  dimension: latency_underflow {
    type: number
    sql: ${TABLE}.latency_underflow ;;
  }

  dimension: log_count {
    type: number
    sql: ${TABLE}.log_count ;;
  }

  dimension: log_type {
    type: string
    sql: ${TABLE}.log_type ;;
  }

  dimension: log_volume {
    type: number
    sql: ${TABLE}.log_volume ;;
  }

  dimension: namespace {
    type: string
    sql: ${TABLE}.namespace ;;
  }

  # dimension: normalization_state {
  #   type: string
  #   sql: ${TABLE}.normalization_state ;;
  # }

  dimension: regex_filter {
    type: string
    sql: ${TABLE}.regex_filter ;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      hour,
      minute,
      year
    ]
    datatype: epoch
    sql: UNIX_SECONDS(${TABLE}.start_time) ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: quota_rejected_long_term_log_volume {
    type: number
    sql: ${TABLE}.quota_rejected_long_term_log_volume ;;
  }

  dimension: quota_limit_per_day {
    type: number
    sql: ${TABLE}.quota_limit_per_day ;;
  }

  dimension: quota_rejected_short_term_log_volume {
    type: number
    sql: ${TABLE}.quota_rejected_short_term_log_volume ;;
  }

  dimension: quota_limit_per_second {
    type: number
    sql: ${TABLE}.quota_limit_per_second ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: last_heartbeat_max {
    hidden: yes
    type: date
    sql: MAX(${last_heartbeat_raw}) ;;
  }

  measure: minutes_since_last_heartbeat {
    type: number
    sql:  (DATETIME_DIFF(CURRENT_DATETIME(), ${last_heartbeat_max}, minute)) * 1 ;;
  }
  
  measure: min_start_time {
    type: date_time
    sql: min(TIMESTAMP_SECONDS(${start_raw}));;
  }

  measure: max_end_time {
    type: date_time
    sql: max(TIMESTAMP_SECONDS(${end_raw}));;
  }
}

view: ingestion_metrics__buckets {
  dimension: ingestion_metrics__buckets {
    type: number
    sql: ingestion_metrics__buckets ;;
  }
}

view: ingestion_metrics__bucketer_lower_bounds {
  dimension: ingestion_metrics__bucketer_lower_bounds {
    type: number
    sql: ingestion_metrics__bucketer_lower_bounds ;;
  }
}
