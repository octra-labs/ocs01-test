Pastikan Anda telah menginstal Rust. Jika belum, Anda dapat menginstalnya menggunakan perintah berikut:
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env

Langkah-langkah
 * Kloning Repositori
   Gunakan perintah git clone untuk menyalin repositori ke komputer lokal Anda:
   git clone https://github.com/octra-labs/ocs01-test.git

 * Masuk ke Direktori Proyek
   Pindah ke direktori proyek yang baru saja Anda kloning:
   cd ocs01-test

 * Bangun Proyek
   Gunakan cargo build untuk membangun proyek. Perintah --release akan membuat versi yang dioptimalkan untuk produksi:
   cargo build --release

 * Pengaturan
   Salin file antarmuka kontrak ke direktori utama proyek:
   cp EI/exec_interface.json .

 * Siapkan File yang Dibutuhkan
   Pastikan dua file berikut ada di direktori yang sama dengan biner yang akan Anda jalankan:
   * wallet.json: Buat file ini dengan kredensial dompet Anda.
   * exec_interface.json: Salin dari folder EI/.
 * Jalankan Aplikasi
   Salin biner rilis dan file antarmuka eksekusi (exec_interface.json) ke direktori CLI Anda. Biner rilis terletak di ./target/release/ocs01-test. Setelah itu, jalankan aplikasi:
   ./target/release/ocs01-test

Setelah menjalankan perintah di atas, Anda akan melihat menu interaktif yang dapat Anda gunakan untuk berinteraksi dengan kontrak pintar.  

kontrak pintar yang diuji adalah octBUHw585BrAMPMLQvGuWx4vqEsybYH9N7a3WNj1WBwrDn

### ❌Jangan ubah file exec_interface.json.
