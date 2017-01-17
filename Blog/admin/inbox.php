<?php
    include 'inc/header.php';
    include 'inc/sidebar.php';
?>

<div class="grid_10">
    <div class="box round first grid">
        <h2>Inbox</h2>
        <?php
            if (isset($_GET['seenid'])) {
               $seenid = $_GET['seenid'];
               $query = "UPDATE tbl_contact
                         SET status='1'
                         WHERE id = '$seenid' ";

                $updated_row = $db->update($query);
                if ($updated_row) {
                    echo "<span class='success'> Message is seen!! </span>";
                }else {
                    echo "<span class='error'> Something wrong!! </span>";
                }
            }
        ?>
        <div class="block">
            <table class="data display datatable" id="example">
			<thead>
				<tr>
					<th>Serial No.</th>
                    <th> Name </th>
                    <th> Email </th>
                    <th> Date </th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
            <?php
                $query = "SELECT * FROM tbl_contact WHERE status='0' order by id desc";
                $msg = $db->select($query);
                if ($msg) {
                    $i = 0;
                    while ($result = $msg->fetch_assoc()) {
                        $i++;
            ?>
				<tr class="odd gradeX">
					<td> <?php echo $i; ?> </td>
					<td> <?php echo $result['firstname'].' '.$result['lastname']; ?> </td>
                    <th> <?php echo $result['email']; ?> </th>
                    <th> <?php echo $fm->textShorten($result['body'], 30); ?> </th>
                    <th> <?php echo $fm->formatDate($result['date']); ?> </th>
					<td>
                        <a href="viewmsg.php?msgid=<?php echo $result['id']; ?>">
                        View</a> ||
                        <a href="replymsg.php?msgid=<?php echo $result['id']; ?>">Reply</a> ||
                        <a onclick="return confirm('Are you sure to move the message?')" href="?seenid=<?php echo $result['id']; ?>">Seen</a>
                    </td>
				</tr>
            <?php } } ?>
			</tbody>
		</table>
    </div>


    <div class="box round first grid">
    <h2>Seen Message</h2>
    <?php
        if (isset($_GET['delid'])) {
            $delid = $_GET['delid'];
            $delquery= "DELETE FROM tbl_contact WHERE id = '$delid' ";
            $deldata = $db->delete($delquery);
            if ($deldata) {
                echo "<span class='success'> Message Deleted Successfully!! </span>";
            }else {
                echo "<span class='error'> Message Not Deleted!! </span>";
            }
        }
    ?>
        <div class="block">
        <table class="data display datatable" id="example">
            <thead>
                <tr>
                    <th>Serial No.</th>
                    <th> Name </th>
                    <th> Email </th>
                    <th> Date </th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <?php
                $query = "SELECT * FROM tbl_contact WHERE status='1' order by id desc";
                $msg = $db->select($query);
                if ($msg) {
                    $i = 0;
                    while ($result = $msg->fetch_assoc()) {
                        $i++;
            ?>
                <tr class="odd gradeX">
                    <td> <?php echo $i; ?> </td>
                    <td> <?php echo $result['firstname'].' '.$result['lastname']; ?> </td>
                    <th> <?php echo $result['email']; ?> </th>
                    <th> <?php echo $fm->textShorten($result['body'], 30); ?> </th>
                    <th> <?php echo $fm->formatDate($result['date']); ?> </th>
                    <td>
                        <a href="viewmsg.php?msgid=<?php echo $result['id']; ?>">
                        View</a> ||
                        <a onclick="return confirm('Are you sure to delete?')"
                        href="?delid=<?php echo $result['id'] ?>"> Delete </a>
                    </td>
                </tr>
            <?php } } ?>
            </tbody>
        </table>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        setupLeftMenu();

        $('.datatable').dataTable();
        setSidebarHeight();
    });
</script>

<?php
    include 'inc/footer.php';
?>
