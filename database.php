<?php

$servername = "localhost";
$username = "seu_usuario";
$password = "sua_senha";
$database = "seu_banco_de_dados";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Falha na conexão: " . $conn->connect_error);
}

$nome = $_POST['nome'];
$cpf = $_POST['cpf'];
$endereco = $_POST['endereco'];
$telefone = $_POST['telefone'];
$email = $_POST['email'];

$sql = "INSERT INTO medicos (nome, cpf, endereco, telefone, email) VALUES ('$nome', '$cpf', '$endereco', '$telefone', '$email')";

if ($conn->query($sql) === TRUE) {
    echo "Médico cadastrado com sucesso!";
} else {
    echo "Erro ao cadastrar médico: " . $conn->error;
}

$conn->close();
?>
