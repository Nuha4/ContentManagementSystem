
<?php
    include 'inc/header.php';
?>
<?php
	if ( !isset($_GET['id']) || $_GET['id'] == NULL ) {
		header("Location: 404.php");
	}else {
		$id = $_GET['id'];
	}
?>

<div class="contentsection contemplete clear">
	<div class="maincontent clear">
		<div class="about">
		<?php
			$query = "select * from tbl_post where id=$id";
			$post = $db->select($query);
			if ($post) {
            	while ($result = $post->fetch_assoc()) {
		?>
		<h2> <?php echo $result['title']; ?></h2>
		<h4>
       		<?php echo $fm->formatDate($result['date']); ?> , By
        	<a href="#"> <?php echo $result['author']; ?> </a>
    	</h4>
    	<!--
		<a href="#"><img src="admin/<?php //echo $result['image']; ?>" alt="post image"/></a>
		-->
		<?php echo $result['body']; ?>

			<div class="relatedpost clear">
			<h2>Related articles</h2>
			<?php
				$catid = $result['cat'];
				$queryrelated = "select * from tbl_post where id='$catid' order by rand() limit 6";
				$relatedpost = $db->select($queryrelated);
				if ($relatedpost) {
            		while ($relatedresult = $relatedpost->fetch_assoc()) {
			?>
			<a href="post.php?id=<?php echo $relatedresult['id']; ?>">
			<?php echo $relatedresult['title']; ?>
			<!--
				<img src="admin/upload/<?php //echo $relatedresult['image']; ?>" alt="post image"/>-->
			</a>
			<?php } } else{
				echo "No related post is created yet.";
			}?>
			</div>

		<?php } } else {
			header("Location:404.php");
		}?>
	    </div>

<?php
	 include 'inc/sidebar.php';
?>
<?php
    include 'inc/footer.php';
?>
