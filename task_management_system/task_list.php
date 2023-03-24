<?php include 'db_connect.php' ?>
<div class="col-lg-12">
    <div class="card card-outline card-success">
        <div class="card-header">
            <?php if($_SESSION['login_type'] == 1): ?>
            <div class="card-tools">
                <a class="btn btn-block btn-sm btn-default btn-flat border-primary" href="./index.php?page=new_task"><i class="fa fa-plus"></i> Add New Task</a>
            </div>
            <?php endif; ?>
        </div>
        <div class="card-body">
            <table class="table tabe-hover table-condensed" id="task_list">
                <colgroup>
                    <col width="5%">
                    <col width="25%">
                    <col width="25%">
                    <col width="20%">
                    <col width="15%">
                    <col width="10%">
                </colgroup>
                <thead>
                    <tr>
                        <th class="text-center">#</th>
                        <th>Task</th>
                        <th>Date Posted</th>
                        <th>Task Due Date</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $i = 1;
                    $where = "";
                    if($_SESSION['login_type'] == 2){
                        $where = " where p.manager_id = '{$_SESSION['login_id']}' ";
                    }elseif($_SESSION['login_type'] == 4){
                        $where = " where concat('[',REPLACE(p.user_ids,',','],['),']') LIKE '%[{$_SESSION['login_id']}]%' ";
                    }
                    
                    $qry = $conn->query("SELECT t.*,p.start_date,p.end_date,p.id as pid FROM task_list t inner join project_list p on p.id = t.project_id $where order by p.name asc");
                    while($row= $qry->fetch_assoc()):
                        $trans = get_html_translation_table(HTML_ENTITIES,ENT_QUOTES);
                        unset($trans["\""], $trans["<"], $trans[">"], $trans["<h2"]);
                        $desc = strtr(html_entity_decode($row['description']),$trans);
                        $desc=str_replace(array("<li>","</li>"), array("",", "), $desc);              
                    ?>
                    <tr>
                        <td class="text-center"><?php echo $i++ ?></td>
                        <td>
                            <p><b><?php echo ucwords($row['task']) ?></b></p>
                            <p class="truncate"><?php echo strip_tags($desc) ?></p>
                        </td>
                        <td><b><?php echo date("M d, Y", strtotime($row['start_date'])) ?></b></td>
                        <td><b><?php echo date("M d, Y", strtotime($row['end_date'])) ?></b></td>
						<td class="text-center">
                            <?php
                            // Check user type and manager ID to determine action buttons to display
                            if($_SESSION['login_type'] == 1 || ($_SESSION['login_type'] == 3 && $row['manager_id'] == $_SESSION['login_id'])):
                            ?>
                                <button class="btn btn-primary bg-gradient-primary btn-sm edit_task" href="javascript:void(0)" data-id="<?php echo $row['id'] ?>" data-task="<?php echo $row['task'] ?>" data-pid="<?php echo $row['pid'] ?>">Edit</button>
                                <button class="btn btn-primary bg-gradient-primary btn-sm delete_task" href="javascript:void(0)" data-id="<?php echo $row['id'] ?>">Delete</button>
                            <?php elseif($_SESSION['login_type'] == 2): ?>
                                <button class="btn btn-primary bg-gradient-primary btn-sm view_task" href="./index.php?page=view_task&id=<?php echo $row['id'] ?>" data-id="<?php echo $row['id'] ?>">View</button>
                            <?php endif; ?>
                        </td>
					</tr>	
				<?php endwhile; ?>
				</tbody>
			</table>
		</div>
	</div>
</div>
<style>
	table p{
		margin: unset !important;
	}
	table td{
		vertical-align: middle !important
	}
</style>
<script>
    $('.edit_task').click(function(){
		uni_modal("Edit Task: "+$(this).attr('data-task'),"edit_task.php?pid=<?php echo $id ?>&id="+$(this).attr('data-id'),"mid-large")
	})
	$('.delete_task').click(function(){
        _conf("Are you sure to delete this task?","delete_task",[$(this).attr('data-id')])
        delete_task($(this).attr('data-id'));
	})
	function delete_task($id){
		start_load()
		$.ajax({
			url:'ajax.php?action=delete_task',
			method:'POST',
			data:{id:$id},
			success:function(resp){
				if(resp==1){
					alert_toast("Data successfully deleted",'success')
					setTimeout(function(){
						location.reload()
					},1500)

				}
			}
		})
	}
</script>