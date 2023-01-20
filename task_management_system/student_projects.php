<?php include'db_connect.php' ?>
<div class="col-lg-12">
	<div class="card card-outline card-success">

		<div class="card-body">
			<table class="table tabe-hover table-bordered" id="list">
				<thead>
					<tr>
						<th class="text-center">#</th>
						<th>Project Adviser</th>
						<th>Project Title</th>
						<th>Members</th>
					
					</tr>
				</thead>
				<tbody>
					<?php
					$i = 1;
					$type = array('',"Adviser","Student","Super Admin");
					$qry = $conn->query("SELECT  
                    p.manager_id,
                    p.name,
                    p.user_ids,
                    u.firstname as firstname,
                    u.lastname as lastname,
                    u.id
                   FROM project_list p
                   LEFT JOIN users u on p.manager_id = u.id");
                    $row= $qry->fetch_assoc();
					while($row= $qry->fetch_assoc()):
					?>
					<tr>
						<th class="text-center"><?php echo $i++ ?></th>
						<td><b><?php echo ucwords($row['firstname']  .' ' . $row['lastname']) ?></b></td>
						<td><b><?php echo ucwords($row['name']) ?></b></td>
						<td>
                                <ul class="users-list clearfix">
                                <?php 
                                if(!empty($row['user_ids'])):
                                    $members = $conn->query("SELECT *,concat(firstname,' ',lastname) as name FROM users where id in (".$row['user_ids'].") order by concat(firstname,' ',lastname) asc");
                                    while($row=$members->fetch_assoc()):
                                ?>
                                        <li>
                                            <img src="assets/uploads/<?php echo $row['avatar'] ?>" alt="User Image" width="56px">
                                            <a class="users-list-name" href="javascript:void(0)"><?php echo ucwords($row['name']) ?></a>
                                            <!-- <span class="users-list-date">Today</span> -->
                                        </li>
                 
                                <?php 
                            endwhile;

                                ?>
                            <?php else: ?>
                                    <li>
                                    <b>No members assigned</b>
                                    </li>
                                    <?php 
                                endif;

                                ?>
                            </ul>
                        </td>
    
					</tr>	
				<?php endwhile; ?>
				</tbody>
			</table>
		</div>
	</div>
</div>