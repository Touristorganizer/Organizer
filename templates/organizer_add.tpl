    <form class='form-horizontal' action=$SELF_URL method='get' id='section_form' name='section_form' role='form'>
      <input type=hidden name=index value=$index>
      <input type=hidden name=ID value='%ID%'>
      <fieldset>
        <div class='box box-form'>
          <div class='box-header with-border'>
            <h4 class='box-title'>_{SECTION}_</h4>
            <span class='pull-right'></span>
          </div>
          <div class='box-body'>
            <div class='form-group'>
              <label class='control-label col-md-3 text-left'  for='SECTION'>_{SECTION}_</label>
              <div class='col-md-9'>
                <input id='SECTION_NAME' name='SECTION_NAME' value='%SECTION_NAME%' class='form-control' type='text' autocomplete="off" required>
              </div>
            </div>
            <div class='form-group'>
              <label class='control-label col-md-3 text-left'  for='SECTION_ICON'>_{SECTION_ICON}_</label>
              <div class='col-md-9'>
                <input id='SECTION_ICON' name='SECTION_ICON' value='%SECTION_ICON%' class='form-control' type='text' autocomplete="off" required>
              </div>
            </div>
          </div>
          <div class='box-footer'>
            <input type=submit name=%ACTION% value='%LNG_ACTION%' class="btn btn-primary" >
          </div>
        </div>
      </fieldset>
    </form>

