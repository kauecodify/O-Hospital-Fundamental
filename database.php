<?php

// DEFINE O DATABASE
$host = "localhost";
$username = "your_username";
$password = "your_password";
$database = "your_database_name";

// conectar ao database
$conn = mysqli_connect($host, $username, $password, $database);

// checar conexão
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// extrair dados
$nome = $_POST["nome"];
$cpf = $_POST["cpf"];
$endereco = $_POST["endereco"];
$telefone = $_POST["telefone"];
$email = $_POST["email"];

// inserir no database
$sql = "INSERT INTO medicos (nome, cpf, endereco, telefone, email) VALUES ('$nome', '$cpf', '$endereco', '$telefone', '$email')";

if (mysqli_query($conn, $sql)) {
    echo "Médico cadastrado com sucesso!";
} else {
    echo "Erro ao cadastrar médico: " . mysqli_error($conn);
}

// fechar conexão
mysqli_close($conn);

?>
