<?php
/**
 * $Author: senfeikeji $
 * ============================================================================
 * 网站地址: http://www.senfeikeji.com
 * 更多PHP开发请登录：http://bbs.senfeikeji.com
 * ============================================================================
*/

require "../system/libs/code.class.php";
$code=new code(60,22);
$code->image();
for($i=1;$i<=4;$i++){
	$checkcode.=$code->checkcode[$i];
}
session_start();
$_SESSION['code']=$checkcode;
?>
