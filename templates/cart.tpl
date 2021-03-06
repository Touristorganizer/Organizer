<div class='panel-group panel_items' >
    <div class='panel' style='background-color: %HEADER_COLOR%;'>
        <div  id='%SELECT_IDS%' class='panel-heading panel_header'>
            <div class='panel_icon'><i class=' %SECTION_ICON% text-primary' aria-hidden='true'></i></div>
            <p class='panel_text'>%SECTION_NAME%</p>
            <a style='color: #fff;' class='toggleIcons text-w'>
                <i class='fa fa-chevron-down' style='margin-top: 10px;' aria-hidden='true'></i>
                <i class='fa fa-chevron-up' style='display: none; margin-top: 10px;' aria-hidden='true'></i>
            </a>
        </div>
        <div class='panel-body' style='padding: 0; display: none;'>
            <ul id=%SECTION_ID% class='list-group' style='margin: 0'>
                %SECTION_CONTENT%
            </ul>
        </div>
    </div>
</div>