<x-app-layout>
    <x-slot name="header">
        <h2 class="font-black text-2xl text-gray-800 leading-tight tracking-tighter uppercase">
            {{ __('🏗️ Tambah Proyek Baru') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-2xl rounded-3xl border border-gray-100">
                <div class="p-10">
                    <form action="{{ route('projects.store') }}" method="POST" class="max-w-3xl">
                        @csrf

                        <div class="grid grid-cols-1 md:grid-cols-2 gap-8 mb-8">


                            <!-- Nama Proyek -->
                            <div class="col-span-2">
                                <x-input-label for="nama_proyek" :value="__('Nama Proyek')" class="font-bold text-gray-700 uppercase text-xs tracking-widest mb-2" />
                                <x-text-input id="nama_proyek" class="block w-full rounded-2xl border-gray-200 focus:ring-indigo-500 focus:border-indigo-500 shadow-sm transition" type="text" name="nama_proyek" :value="old('nama_proyek')" required autofocus placeholder="Contoh: Pembangunan Jembatan Merah" />
                                <x-input-error :messages="$errors->get('nama_proyek')" class="mt-2" />
                            </div>


                            <!-- Lokasi -->
                            <div class="col-span-2">
                                <x-input-label for="lokasi" :value="__('Lokasi')" class="font-bold text-gray-700 uppercase text-xs tracking-widest mb-2" />
                                <x-text-input id="lokasi" class="block w-full rounded-2xl border-gray-200 focus:ring-indigo-500 focus:border-indigo-500 shadow-sm" type="text" name="lokasi" :value="old('lokasi')" required placeholder="Contoh: Jl. Sudirman No. 1, Jakarta" />
                                <x-input-error :messages="$errors->get('lokasi')" class="mt-2" />
                            </div>

                            <!-- Manajer Assignment -->
                            <div class="col-span-1">
                                <x-input-label for="manager_id" :value="__('Penanggung Jawab (Manajer)')" class="font-bold text-gray-700 uppercase text-xs tracking-widest mb-2" />
                                <select name="manager_id" id="manager_id" class="block w-full rounded-2xl border-gray-200 focus:ring-indigo-500 focus:border-indigo-500 shadow-sm transition" required>
                                    <option value="">-- Pilih Manajer --</option>
                                    @foreach($managers as $manager)
                                        <option value="{{ $manager->id }}" {{ old('manager_id') == $manager->id ? 'selected' : '' }}>
                                            {{ $manager->name }}
                                        </option>
                                    @endforeach
                                </select>
                                <x-input-error :messages="$errors->get('manager_id')" class="mt-2" />
                            </div>

                            <!-- Master Pekerjaan -->
                            <div class="col-span-1">
                                <x-input-label for="master_pekerjaan_id" :value="__('Master Pekerjaan')" class="font-bold text-gray-700 uppercase text-xs tracking-widest mb-2" />
                                <select name="master_pekerjaan_id" id="master_pekerjaan_id" class="block w-full rounded-2xl border-gray-200 focus:ring-indigo-500 focus:border-indigo-500 shadow-sm transition" required>
                                    <option value="" data-durasi="0">-- Pilih Master Pekerjaan --</option>
                                    @foreach($masterPekerjaans as $master)
                                        <option value="{{ $master->id }}" data-durasi="{{ $master->total_durasi_hari }}" {{ old('master_pekerjaan_id') == $master->id ? 'selected' : '' }}>
                                            {{ $master->kode_pekerjaan }} - {{ $master->nama_pekerjaan }} ({{ $master->total_durasi_hari }} Hari)
                                        </option>
                                    @endforeach
                                </select>
                                <x-input-error :messages="$errors->get('master_pekerjaan_id')" class="mt-2" />
                            </div>

                            <!-- Tanggal Mulai -->
                            <div class="col-span-1">
                                <x-input-label for="tanggal_mulai" :value="__('Tanggal Mulai')" class="font-bold text-gray-700 uppercase text-xs tracking-widest mb-2" />
                                <x-text-input id="tanggal_mulai" class="block w-full rounded-2xl border-gray-200 focus:ring-indigo-500 focus:border-indigo-500 shadow-sm" type="date" name="tanggal_mulai" :value="old('tanggal_mulai')" required />
                                <x-input-error :messages="$errors->get('tanggal_mulai')" class="mt-2" />
                            </div>

                            <!-- Tanggal Selesai (otomatis, readonly) -->
                            <div class="col-span-1">
                                <x-input-label for="tanggal_selesai_display" :value="__('Tanggal Selesai (Otomatis)')" class="font-bold text-gray-700 uppercase text-xs tracking-widest mb-2" />
                                <div class="relative">
                                    <x-text-input id="tanggal_selesai_display" class="block w-full rounded-2xl border-gray-200 bg-gray-50 shadow-sm cursor-not-allowed text-gray-500" type="date" readonly placeholder="Akan dihitung otomatis" />
                                    <div class="absolute inset-y-0 right-4 flex items-center pointer-events-none">
                                        <span class="text-[10px] font-black text-indigo-400 uppercase tracking-widest">Otomatis</span>
                                    </div>
                                </div>
                                <p class="text-[10px] text-gray-400 mt-1.5 font-medium">📅 Tanggal Mulai + Durasi Master Pekerjaan</p>
                            </div>
                        </div>

                        <div class="flex items-center justify-end mt-10 gap-6 pt-6 border-t border-gray-50">
                            <a href="{{ route('projects.index') }}" class="text-xs font-black text-gray-400 hover:text-gray-900 transition uppercase tracking-widest">Batal</a>
                            <x-primary-button class="rounded-2xl py-3 px-8 shadow-indigo-200 shadow-lg hover:shadow-indigo-300 transition-all duration-300">
                                {{ __('SIMPAN PROYEK 🚀') }}
                            </x-primary-button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        function hitungTanggalSelesai() {
            const mulai = document.getElementById('tanggal_mulai').value;
            const selectMaster = document.getElementById('master_pekerjaan_id');
            const durasi = parseInt(selectMaster.options[selectMaster.selectedIndex].getAttribute('data-durasi') || '0', 10);
            const display = document.getElementById('tanggal_selesai_display');

            if (mulai && durasi > 0) {
                const tgl = new Date(mulai);
                tgl.setDate(tgl.getDate() + durasi);
                const yyyy = tgl.getFullYear();
                const mm   = String(tgl.getMonth() + 1).padStart(2, '0');
                const dd   = String(tgl.getDate()).padStart(2, '0');
                display.value = `${yyyy}-${mm}-${dd}`;
            } else {
                display.value = '';
            }
        }

        document.getElementById('tanggal_mulai').addEventListener('change', hitungTanggalSelesai);
        document.getElementById('master_pekerjaan_id').addEventListener('change', hitungTanggalSelesai);
        
        // Trigger calculation on load in case there's old value
        window.addEventListener('load', hitungTanggalSelesai);
    </script>
</x-app-layout>
