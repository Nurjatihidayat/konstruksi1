<?php
echo "<h2>Informasi PHP & PDO</h2>";
echo "PHP Version: " . phpversion() . "<br>";
echo "Loaded Extensions: <pre>";
print_r(get_loaded_extensions());
echo "</pre>";

echo "<h3>PDO Drivers:</h3>";
if (class_exists('PDO')) {
    echo "PDO: ✅ AKTIF<br>";
    echo "Available drivers: " . implode(', ', PDO::getAvailableDrivers()) . "<br>";
} else {
    echo "PDO: ❌ TIDAK AKTIF<br>";
}

echo "<h3>pdo_mysql:</h>";
if (extension_loaded('pdo_mysql')) {
    echo "pdo_mysql: ✅ AKTIF<br>";
} else {
    echo "pdo_mysql: ❌ TIDAK AKTIF<br>";
}
?>