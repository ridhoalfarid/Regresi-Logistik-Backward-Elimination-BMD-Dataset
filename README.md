# Regresi-Logistik-Backward-Elimination untuk Mengetahui Faktor yang Memengaruhi Patah Tulang (_Fracture_)
Pemodelan regresi logistik menggunakan _backward elimination_ untuk mengetahui faktor yang mempengaruhi  status patah tulang (_fracture_). Variabel yang digunakan untuk memprediksi _fracture_ adalah variabel usia (_age_), jenis kelamin (_sex_), BMI, dan BMD. BMI diperoleh melalui _wight_kg_/(_height_cm_/100)^2.

Pada variabel _fracture_ 0 adalah _no fracture_ dan 1 adalah  _fracture_.

Dataset yang digunakan adalah: https://www.kaggle.com/datasets/amarsharma768/bmd-data?resource=download



### **_Output_ yang diperoleh**

Uji Parameter Secara Parsial
![alt text](https://github.com/ridhoalfarid/Regresi-Logistik-Backward-Elimination/blob/main/public/reglok1.png?raw=true)
Berdasarkan gambar di atas, dapat dilihat bahwa terdapat beberapa variabel 
yang tidak signifikan (memiliki nilai p-value > 0,05). Saya akan 
menghilangkan variabel yang tidak signifikan menggunakan metode _backward elimination_ 
(menghilangkan satu persatu variabel yang memiliki nilai p-value terbesar hingga 
menyisakan variabel dengan p-value < 0,05). Variabel dengan nilai p-value terbesar 
adalah variabel **bmi** dengan p-value 0,393537. 

Hasil _Backward Elimination_ 1
![alt text](https://github.com/ridhoalfarid/Regresi-Logistik-Backward-Elimination/blob/main/public/reglok2.png?raw=true)
Berdasarkan gambar di atas, dapat dilihat bahwa masih terdapat beberapa 
variabel yang tidak signifikan (memiliki nilai p-value > 0,05). Saya akan 
menghilangkan variabel yang tidak signifikan tersebut menggunakan metode _backward elimination_ kembali. Variabel dengan nilai p-value terbesar adalah variabel **_age_** dengan p-value 0,460498.

Hasil _Backward Elimination_ 2
![alt text](https://github.com/ridhoalfarid/Regresi-Logistik-Backward-Elimination/blob/main/public/reglok3.png?raw=true)
Berdasarkan gambar di atas, dapat dilihat bahwa masih terdapat 1 variabel 
yang tidak signifikan (memiliki nilai p-value > 0,05). Praktikan akan 
menghilangkan variabel yang tidak signifikan tersebut menggunakan metode 
_backward elimination_. Variabel dengan nilai p-value terbesar adalah variabel **_sexman_** dengan 
p-value 0,0544.

Hasil _Backward Elimination_ 3
![alt text](https://github.com/ridhoalfarid/Regresi-Logistik-Backward-Elimination/blob/main/public/reglok4.png?raw=true)
Berdasarkan gambar di atas, dapat dilihat bahwa semua variabel telah 
signifikan (p-value < 0,05). Untuk memprediksi fracture, dapat dimulai dengan 
menuliskan persamaan menggunakan keofisien dari model:

![alt text](https://github.com/ridhoalfarid/Regresi-Logistik-Backward-Elimination/blob/main/public/persamaan.png?raw=true)

Ketepatan Klasifikasi
![alt text](https://github.com/ridhoalfarid/Regresi-Logistik-Backward-Elimination-BMD-Dataset/blob/main/public/klasifikasi.png?raw=true)
                           Untuk menentukan besarnya ketepatan klasifikasi dilakukan menggunakan data uji. Sehingga didapatkan hsil seperti gambar berikut.
Berdasarkan gambar di atas diperoleh akurasi model sperti gambar berikut.
![alt text](https://github.com/ridhoalfarid/Regresi-Logistik-Backward-Elimination-BMD-Dataset/blob/main/public/accuracy.png?raw=true)
                           Model regresi logistik yang diperoleh cukup baik karena mampu memprediksi data dengan benar sebesar 95,23%.







