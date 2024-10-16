- dashboard: main
  title: Main
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - name: Ingested Events
    type: text
    title_text: Ingested Events
    subtitle_text: ''
    body_text: ''
    row: 0
    col: 0
    width: 7
    height: 1
  - name: Throughput
    type: text
    title_text: Throughput
    subtitle_text: ''
    body_text: ''
    row: 0
    col: 7
    width: 9
    height: 1
  - name: Alerts
    type: text
    title_text: Alerts
    subtitle_text: ''
    body_text: ''
    row: 0
    col: 16
    width: 7
    height: 1
  - title: Alert
    name: Alert
    explore: rule_detections
    type: single_value
    fields: [rule_detections.count_for_drill, rule_detections.period]
    sorts: [rule_detections.period desc]
    limit: 500
    dynamic_fields: [{table_calculation: delta, label: Delta, expression: '(${rule_detections.count_for_drill}
          - offset(${rule_detections.count_for_drill}, 1))', value_format: "#,##0;-#,##0",
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: "[>=1000000]#,##0.0,,\" M\";[>=1000]0.0,\" K\";0"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    note_state: collapsed
    note_display: hover
    note_text: Delta compared to previous time period
    listen:
      Time: rule_detections.period_filter
    row: 3
    col: 16
    width: 8
    height: 3
  - title: Ingestion Data Size
    name: Ingestion Data Size
    explore: ingestion_metric_with_ingestion_stats
    type: single_value
    fields: [ingestion_metric_with_ingestion_stats.total_size_bytes, ingestion_metric_with_ingestion_stats.period]
    filters:
      ingestion_metric_with_ingestion_stats.log_type: -"FORWARDER_HEARTBEAT"
    sorts: [ingestion_metric_with_ingestion_stats.period desc]
    limit: 500
    dynamic_fields: [{category: table_calculation, expression: "${ingestion_metric_with_ingestion_stats.total_size_bytes}\
          \ - offset(${ingestion_metric_with_ingestion_stats.total_size_bytes},1)",
        label: Delta, value_format: '#,##0.0,,," GB";-#,##0.0,,," GB"', value_format_name: !!null '',
        _kind_hint: measure, table_calculation: delta, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: "[>=1000000000000000]#,##0.0,,,,,\" PB\";[>=1000000000000]#,##0.0,,,,\" TB\";#,##0.0,,,\" GB\""
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    note_state: collapsed
    note_display: hover
    note_text: Delta compared to previous time period
    listen:
      Time: ingestion_metric_with_ingestion_stats.period_filter
    row: 3
    col: 7
    width: 9
    height: 3
  - title: Events Over Time
    name: Events Over Time
    explore: ingestion_metric_with_ingestion_stats
    type: looker_column
    fields: [ingestion_metric_with_ingestion_stats.total_entry_number, ingestion_metric_with_ingestion_stats.timestamp_date,
      ingestion_metric_with_ingestion_stats.log_type_for_drill]
    pivots: [ingestion_metric_with_ingestion_stats.log_type_for_drill]
    fill_fields: [ingestion_metric_with_ingestion_stats.timestamp_date]
    filters:
      ingestion_metric_with_ingestion_stats.log_type_for_drill: -"FORWARDER_HEARTBEAT",-NULL
      ingestion_metric_with_ingestion_stats.period: This Period
    sorts: [ingestion_metric_with_ingestion_stats.timestamp_date desc, ingestion_metric_with_ingestion_stats.log_type_for_drill]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Events Count, orientation: left, series: [{axisId: total_events_count,
            id: total_events_count, name: Total Events Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Date
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    note_state: collapsed
    note_display: hover
    note_text: Trends for volume of different event types ingested by Chronicle
    listen:
      Time: ingestion_metric_with_ingestion_stats.period_filter
    row: 7
    col: 0
    width: 10
    height: 9
  - title: Events for Main Dashboard
    name: Events for Main Dashboard
    explore: ingestion_metric_with_ingestion_stats
    type: single_value
    fields: [ingestion_metric_with_ingestion_stats.total_entry_number, ingestion_metric_with_ingestion_stats.period]
    sorts: [ingestion_metric_with_ingestion_stats.period desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: delta, label: Delta, expression: '${ingestion_metric_with_ingestion_stats.total_entry_number}
          - offset(${ingestion_metric_with_ingestion_stats.total_entry_number}, 1)', value_format: "#,##0,\" K\";-#,##0,\" K\"",
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: "[>=1000000000]#,##0,,,\" B\";[>=1000000]0,,\" M\";0,\" K\""
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    note_state: collapsed
    note_display: hover
    note_text: Delta compared to previous time period
    listen:
      Time: ingestion_metric_with_ingestion_stats.period_filter
    row: 3
    col: 0
    width: 7
    height: 3
  - title: Global Threat Map - IOC IP Matches
    name: Global Threat Map - IOC IP Matches
    explore: ioc_matches
    type: looker_map
    fields: [ioc_matches.ioc_value, ioc_matches.count, ioc_matches.ioc_location]
    filters:
      ioc_matches.ioc_type: '"IOC_TYPE_IP"'
    sorts: [ioc_matches.count desc]
    limit: 5000
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: pixels
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_latitude: 34.28116438134217
    map_longitude: -65.88741302490236
    map_zoom: 3
    map_marker_color: [red]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    note_state: collapsed
    note_display: hover
    note_text: Geo-location of the IP addresses of IOC matches, put on a Global Map
    listen:
      Time: ioc_matches.event_timestamp_date
    row: 5
    col: 10
    width: 14
    height: 9
  filters:
  - name: Time
    title: Time
    type: field_filter
    default_value: 7 days
    allow_multiple_values: true
    required: true
    ui_config:
      type: advanced
      display: popover
    explore: ingestion_stats
    listens_to_filters: []
    field: ingestion_stats.period_filter