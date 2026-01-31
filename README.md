# Ollama + OpenWebUI Docker Setup

Self-hosted AI models dengan Ollama dan antarmuka web modern menggunakan OpenWebUI.

## 🚀 Fitur

- **Ollama** - Platform untuk menjalankan model AI lokal
- **OpenWebUI** - Antarmuka web modern untuk interaksi dengan AI
- **Resource Efficient** - Konfigurasi hemat RAM & CPU
- **Docker Compose** - Setup mudah dengan containerisasi
- **Health Checks** - Monitoring otomatis service
- **Persistent Storage** - Data tersimpan aman di volume Docker

## 📋 Prasyarat

- Docker & Docker Compose terinstall
- Minimum 4GB RAM (rekomendasi 8GB untuk model besar)
- CPU dengan support AVX (untuk performa optimal)
- Network `dokploy-network` sudah tersedia (atau ubah ke `bridge`)

## 🔧 Instalasi

1. **Clone repository:**
   ```bash
   git clone https://github.com/anamipit/ollama-openwebui.git
   cd ollama-openwebui
   ```

2. **Edit secret key (WAJIB):**
   Edit file `docker-compose.yml` dan ganti:
   ```yaml
   WEBUI_SECRET_KEY=ganti_dengan_kata_acak_bebas
   ```
   Jadi kata acak Anda sendiri (min 12 karakter).

3. **Jalankan services:**
   ```bash
   docker-compose up -d
   ```

4. **Cek status:**
   ```bash
   docker-compose ps
   docker-compose logs -f
   ```

## 📊 Konfigurasi Resource

Konfigurasi default dioptimalkan untuk hemat resource:

- **OLLAMA_KEEP_ALIVE=2m** - Model dimatikan setelah 2 menit idle
- **OLLAMA_NUM_PARALLEL=1** - Request diantrikan (tidak paralel)
- **Health check** - Monitoring setiap 10 detik

## 🌐 Akses

- **OpenWebUI**: http://localhost:8080 (atau port yang tersedia)
- **Ollama API**: http://localhost:11434

## 📦 Download Model

1. Buka OpenWebUI di browser
2. Masuk ke Settings → Models
3. Pilih dan download model yang diinginkan
4. Atau via terminal:
   ```bash
   docker exec -it ollama ollama pull llama2
   ```

## 🔧 Management

**Lihat model yang tersedia:**
```bash
docker exec -it ollama ollama list
```

**Download model baru:**
```bash
docker exec -it ollama ollama pull namamodel
```

**Hapus model:**
```bash
docker exec -it ollama ollama rm namamodel
```

**Restart services:**
```bash
docker-compose restart
```

**Update images:**
```bash
docker-compose pull
docker-compose up -d
```

## 🛠️ Troubleshooting

**Container tidak start:**
- Cek logs: `docker-compose logs`
- Pastikan port tidak conflict
- Cek resource tersedia (RAM/CPU)

**Model tidak bisa download:**
- Cek koneksi internet
- Cek disk space tersedia
- Coba model yang lebih kecil dulu

**OpenWebUI error:**
- Pastikan Ollama service healthy
- Cek WEBUI_SECRET_KEY sudah diganti
- Cek network connection antara container

## 📋 Model Rekomendasi

**Ringan (2-4GB RAM):**
- `phi3` - Microsoft Phi-3
- `tinyllama` - TinyLlama 1.1B

**Sedang (4-8GB RAM):**
- `llama2:7b` - Llama 2 7B
- `mistral:7b` - Mistral 7B

**Berperforma (8GB+ RAM):**
- `llama2:13b` - Llama 2 13B
- `codellama:13b` - CodeLlama 13B

## 🔒 Keamanan

- **WAJIB** ganti `WEBUI_SECRET_KEY`
- Gunakan HTTPS di production
- Restrick akses network jika perlu
- Update images secara berkala

## 📚 Referensi

- [Ollama Documentation](https://ollama.ai/)
- [OpenWebUI Documentation](https://docs.openwebui.com/)
- [Docker Compose Reference](https://docs.docker.com/compose/)

## 🤝 Kontribusi

Feel free untuk submit issue atau pull request!

## 📄 Lisensi

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.