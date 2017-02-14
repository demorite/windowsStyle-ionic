<?php
	/**
	 * Created by PhpStorm.
	 * User: dylan
	 * Date: 01/02/2017
	 * Time: 17:01
	 */

	if (isset($_GET)) {

		$function = htmlspecialchars($_GET['function'], ENT_QUOTES);
		switch ($function) {
			case "getMessages":
				echo json_encode(getMessages());
				break;
			case "addMessage":
				addMessage(htmlspecialchars($_GET['message'], ENT_QUOTES));
				break;
		}
	}

	function connect() {
		try {
			return $pdo = new PDO('mysql:host=localhost;dbname=ionic', 'root');
		} catch (Exception $e) {
			echo $e->getMessage();
			die();
		}
	}

	function getMessages() {
		return connect()->query("SELECT * FROM messages")->fetchAll();
	}

	function addMessage($message) {
		return connect()->prepare("INSERT INTO messages (message) VALUES (?)")->execute([$message]);
	}