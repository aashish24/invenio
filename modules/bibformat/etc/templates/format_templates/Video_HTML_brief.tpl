<div class="media htmlbrief">
    <span class="pull-left">

    </span>
    <span class="pull-right">
        {# {{ bfe_altmetric(badgetype='donut', popover='left', no_script='1', prefix="<br>") }} #}
        <a href="{{ url_for('record.metadata', recid=record['recid']) }}">{{ bfe_video_bigthumb(bfo, ) }}</a>
    </span>
    <div class="media-body">
        <p>
            <span class="label">{{ record.get('imprint.date', '') }}</span>
            {{ bfe_doi(bfo, prefix='<span class="label label-warning">', suffix='</span>') }}
            {{ bfe_primary_report_number(bfo, prefix='<span class="label label-important">', suffix='</span>') }}
            {{ bfe_additional_report_numbers(bfo, prefix='<span class="label label-inverse">', suffix="</span>",
                                             separator='</span> <span class="label label-inverse">', link="no") }}
			<i class="icon icon-film"></i>
        </p>

        <h4 class="media-heading muted_a">
            <a href="{{ url_for('record.metadata', recid=record['recid']) }}">
                {{ record.get('title.title', '') }}
            </a>
        </h4>

        <p>
            {% set authors = record.get('authors[:].full_name', []) %}
            {% set sep = joiner("; ") %}
            {% for full_name in authors[0:4] %} {{ sep() }}
              <a href="{{ url_for('search.search', p='author:"' + full_name + '"') }}">
                {{ full_name }}
              </a>
            {% endfor %}
            {% if record.get('number_of_authors', 0) > 4 %}
            {{ sep() }}
            <a href="#authors_{{ record['recid'] }}"
               class="muted" data-toggle="collapse"
               data-target="#authors_{{ record['recid'] }}">
                <em>{{ _(' et al') }}</em>
            </a>
            {% endif %}
            <div id="authors_{{ record['recid'] }}" class="collapse" style="height: 0px; display: block-inline;">
            {% for full_name in authors[4:] %} {{ sep() }}
              <a href="{{ url_for('search.search', p='author:"' + full_name + '"') }}">
                {{ full_name }}
              </a>
            {% endfor %}
            </div>
        </p>
        <p>
            {{ bfe_abstract(bfo, limit="1", prefix='<p>', prefix_en="<i>Abstract</i>: ", prefix_fr="<br/><i>Résumé</i>: ", suffix="</p>", highlight="no", print_lang='en') }}

            {{ bfe_keywords(bfo, separator=", ", prefix="<br/> <i>Keyword</i>: ") }}
        </p>
    </div>
</div>