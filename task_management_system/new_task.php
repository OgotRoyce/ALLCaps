<?php
include 'db_connect.php';
$id = isset($_GET['id']) ? $_GET['id'] : '';
?>
<div class="col-lg-12">
  <div class="card card-outline card-primary">
    <div class="card-body">
      <form action="" id="manage-task">
        <input type="hidden" name="id" value="<?php echo $id; ?>">
        <div class="row">
          <div class="col-md-6">
            <div class="form-group">
              <label for="" class="control-label">Task Name</label>
              <input type="text" class="form-control form-control-sm" name="name" value="<?php echo isset($name) ? $name : ''; ?>">
            </div>
          </div>
          <div class="col-md-6">
            <div class="form-group">
              <label for="" class="control-label">Due Date</label>
              <input type="date" class="form-control form-control-sm" autocomplete="off" name="due_date" value="<?php echo isset($due_date) ? date("Y-m-d",strtotime($due_date)) : ''; ?>">
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6">
            <div class="form-group">
              <label for="" class="control-label">Assigned To</label>
              <select class="form-control form-control-sm select2" multiple="multiple" name="user_ids[]">
                <?php
                  $students = $conn->query("SELECT *, concat(firstname,' ',lastname) as name FROM users WHERE type != 1 ORDER BY concat(firstname,' ',lastname) ASC");
                  $all_students_option_selected = isset($user_ids) && $user_ids == "all";
                  $selected_options = "";
                  while ($row= $students->fetch_assoc()):
                    $is_selected = isset($user_ids) && in_array($row['id'],explode(',',$user_ids));
                    if ($all_students_option_selected && !$is_selected) {
                      continue;
                    }
                    $selected_options .= "<option value='{$row['id']}'".($is_selected ? " selected" : "").">{$row['name']}</option>";
                  endwhile;
                  echo "<option value='all'".($all_students_option_selected ? " selected" : "").">All Students</option>";
                  echo $selected_options;
                ?>
              </select>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-10">
            <div class="form-group">
              <label for="" class="control-label">Description</label>
              <textarea name="description" id="description" cols="30" rows="10" class="summernote form-control">
                <?php echo isset($description) ? $description : ''; ?>
              </textarea>
              <div class="custom-file">
                <input type="file" class="custom-file-input" id="customFile" name="img" onchange="displayImg(this,$(this))">
                <label class="custom-file-label" for="customFile">Add file</label>
              </div>
            </div>
          </div>
        </div>
        <div class="card-footer border-top border-info">
          <div class="d-flex w-100 justify-content-center align-items-center">
            <button class="btn save_task" href="javascript:void(0)" data-id="<?php echo isset($id) ? $id : ''; ?>" data-task="<?php echo isset($name) ? $name : ''; ?>" data-pid="<?php echo isset($pid) ? $pid : ''; ?>">Save</button>
            <button class="btn btn-flat bg-gradient-secondary mr-2" type="button" onclick="location.href='index.php?page=task_list'">Cancel</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<script>
  // Initialize Summernote editor
  $('.summernote').summernote({
    height: 200,
    toolbar: [
      ['style', ['bold', 'italic', 'underline', 'clear']],
      ['font', ['strikethrough', 'superscript', 'subscript']],
      ['fontsize', ['fontsize']],
      ['color', ['color']],
      ['para', ['ul', 'ol', 'paragraph']],
      ['height', ['height']],
    ],
  });

  // Show/hide file input when Add File button is clicked
  $('#add-file-btn').click(function(){
    $('#file-input').click();
  });
  $('#file-input').change(function(){
    var filename = $(this).val().split('\\').pop();
    var ext = filename.split('.').pop().toLowerCase();
    var allowed_exts = ['pdf','doc','docx','xls','xlsx','ppt','pptx','jpg','jpeg','png'];
    if($.inArray(ext, allowed_exts) == -1) {
      alert_toast('Only PDF, Word, Excel, PowerPoint, and image files are allowed', "warning");
      $(this).val('');
    } else {
      $('#description').val($('#description').val() + '\n\nFile: ' + filename);
    }
  });
  $('#new_task').click(function(){
		uni_modal("New Task For <?php echo ucwords($name) ?>","manage_task.php?pid=<?php echo $id ?>","mid-large")
	})
	$('.save_task').click(function(){
		uni_modal("Edit Task: "+$(this).attr('data-task'),"manage_task.php?pid=<?php echo $id ?>&id="+$(this).attr('data-id'),"mid-large")
	})
</script>

