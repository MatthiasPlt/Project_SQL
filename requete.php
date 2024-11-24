<?php
require_once 'vendor/autoload.php';

$faker = Faker\Factory::create('fr_FR');

require 'C:\Users\polle\OneDrive\Bureau\E-commerce\db.php';

for ($i = 0; $i < 10; $i++) {
    $timestamp = time();
    $month = $faker->numberBetween(01, 12);
    $year = $faker->numberBetween(22, 30); // Années 2022 à 2030
    
    // Correction de la syntaxe pour user
    $stmt = $pdo->prepare("INSERT INTO user (prenom, nom, email, telephone)
                    VALUES (:prenom, :nom, :email, :telephone)");
    
    $stmt->execute([
        ':prenom' => $faker->firstName,
        ':nom' => $faker->lastName,
        ':email' => $faker->email,
        ':telephone' => $faker->phoneNumber
    ]);

    $user_id = $pdo->lastInsertId();
echo "User  ID: " . $user_id . "\n"; // Ajoutez ceci pour voir l'ID de l'utilisateur

    // Correction pour adress
    $stmt = $pdo->prepare("INSERT INTO adress (adress, IDuser)
                  VALUES (:adress, :user_id)");
    $stmt->execute([
        ':adress' => $faker->address,
        ':user_id' => $user_id
    ]);

    $adress_id = $pdo->lastInsertID();

    // Correction pour commande
    $stmt = $pdo->prepare("INSERT INTO commande (date, number, IDuser, IDAdress)
                VALUES (:date, :number, :user_id, :adress_id)");
    $stmt->execute([
        ':date' => $faker->date,
        ':number' => $faker->numberBetween(1000,9999),
        ':user_id' => $user_id,
        ':adress_id' => $adress_id
    ]);
            
    // Correction pour payment
    $stmt = $pdo->prepare("INSERT INTO payment (Iban, carteNumber, expiryDate, CVC, IDuser)
                VALUES (:iban, :carte_number, :expiry_date, :cvc, :user_id)");
    $month = $faker->numberBetween(1, 12);
    $year = $faker->numberBetween(22, 30); // Années 2022 à 2030
    
    $expiry_date = $month . $year;
    $stmt->execute([
        ':iban' => $faker->iban,
        ':carte_number' => $faker->creditCardNumber,
        ':expiry_date' => $expiry_date,
        ':cvc' => $faker->numberBetween(100,999),
        ':user_id' => $user_id
    ]);

    // Correction pour cart
    $stmt = $pdo->prepare("INSERT INTO cart (quantity, IDuser)
                VALUES (:quantity, :user_id)");
    $stmt->execute([
        ':quantity' => $faker->numberBetween(1,10),
        ':user_id' => $user_id
    ]);

    $cart_id = $pdo->lastInsertID();


     // Correction pour product
    $stmt = $pdo->prepare("INSERT INTO product (nom, prix, description, recommendation)
         VALUES (:nom, :prix, :description, :recommendation)");
    $stmt->execute([
        ':nom' => $faker->word,
        ':prix' => $faker->randomFloat(2, 10, 1000),
        ':description' => $faker->text,
        ':recommendation' => $faker->text
    ]);

    $product_id = $pdo->lastInsertID();
            
    // Correction pour productcart
    $stmt = $pdo->prepare("INSERT INTO productcart (quantity, IDProduct, IDCart)
                VALUES (:quantity, :product_id, :cart_id)");
    $stmt->execute([
        ':quantity' => $faker->numberBetween(1,10),
        ':product_id' => $product_id,
        ':cart_id' => $cart_id
    ]);

    // Correction pour rate
    $stmt = $pdo->prepare("INSERT INTO rate (note, description, IDUser, IDProduct)
                VALUES (:note, :description, :user_id, :product_id)");
    $stmt->execute([
        ':note' => $faker->numberBetween(1,5),
        ':description' => $faker->text,
        ':user_id' => $user_id,
        ':product_id' => $product_id
    ]);
}
?>