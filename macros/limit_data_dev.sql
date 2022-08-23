{% limit_data_dev(colname) %}

{% if target.name == 'development' %}
where {{colname}} >= dateadd('day', -30, current_timestamp)
{% endif %}

{% endmacro %}