<x-app-layout>
    <x-slot name="header">
        <h2 class="font-black text-2xl text-gray-800 leading-tight tracking-tighter uppercase">
            🏗️ Tambah Proyek Baru
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-5xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-2xl rounded-3xl border border-gray-100">
                <div class="p-10">
                    <form action="{{ route('projects.store') }}" method="POST" id="createProjectForm">
                        @csrf

                        @if($errors->any())
                        <div class="mb-6 bg-red-50 border-l-4 border-red-500 p-4 rounded-xl">
                            <ul class="text-red-700 text-sm font-semibold list-disc pl-4">
                                @foreach($errors->all() as $e)<li>{{ $e }}</li>@endforeach
                            </ul>
                        </div>
                        @endif

                        <div class="grid grid-cols-1 md:grid-cols-2 gap-8 mb-8">

                            <!-- Nama Proyek -->
                            <div class="col-span-2">
                                <label class="block font-bold text-gray-700 uppercase text-xs tracking-widest mb-2">Nama Proyek</label>
                                <input type="text" name="nama_proyek" value="{{ old('nama_proyek') }}" required
                                    class="block w-full rounded-2xl border-gray-200 focus:ring-indigo-500 focus:border-indigo-500 shadow-sm"
                                    placeholder="Contoh: Pembangunan Gedung Kantor">
                            </div>

                            <!-- Lokasi -->
                            <div class="col-span-2">
                                <label class="block font-bold text-gray-700 uppercase text-xs tracking-widest mb-2">Lokasi</label>
                                <input type="text" name="lokasi" value="{{ old('lokasi') }}" required
                                    class="block w-full rounded-2xl border-gray-200 focus:ring-indigo-500 focus:border-indigo-500 shadow-sm"
                                    placeholder="Contoh: Jl. Sudirman No. 1, Jakarta">
                            </div>

                            <!-- Manajer -->
                            <div>
                                <label class="block font-bold text-gray-700 uppercase text-xs tracking-widest mb-2">Penanggung Jawab (Manajer)</label>
                                <select name="manager_id" required class="block w-full rounded-2xl border-gray-200 focus:ring-indigo-500 focus:border-indigo-500 shadow-sm">
                                    <option value="">-- Pilih Manajer --</option>
                                    @foreach($managers as $m)
                                    <option value="{{ $m->id }}" {{ old('manager_id') == $m->id ? 'selected' : '' }}>{{ $m->name }}</option>
                                    @endforeach
                                </select>
                            </div>

                            <!-- Tanggal Mulai -->
                            <div>
                                <label class="block font-bold text-gray-700 uppercase text-xs tracking-widest mb-2">Tanggal Mulai</label>
                                <input type="date" name="tanggal_mulai" id="tanggal_mulai" value="{{ old('tanggal_mulai') }}" required
                                    class="block w-full rounded-2xl border-gray-200 focus:ring-indigo-500 focus:border-indigo-500 shadow-sm">
                            </div>
                        </div>

                        <!-- ======== MASTER PEKERJAAN MULTI SELECT ======== -->
                        <div class="mb-8">
                            <label class="block font-bold text-gray-700 uppercase text-xs tracking-widest mb-3">
                                Master Pekerjaan <span class="text-indigo-500">(Bisa Pilih Beberapa — urutan sesuai daftar)</span>
                            </label>

                            <!-- Search -->
                            <input type="text" id="searchMaster" placeholder="🔍 Cari master pekerjaan..."
                                class="block w-full rounded-xl border-gray-200 focus:ring-indigo-500 focus:border-indigo-500 shadow-sm text-sm mb-3">

                            <!-- Checkbox list -->
                            <div id="masterList" class="grid grid-cols-1 md:grid-cols-2 gap-3 max-h-72 overflow-y-auto border border-gray-100 rounded-2xl p-4 bg-gray-50">
                                @foreach($masterPekerjaans as $master)
                                <label class="master-item flex items-start gap-3 p-3 rounded-xl bg-white shadow-sm border border-gray-100 cursor-pointer hover:border-indigo-300 hover:shadow-md transition"
                                    data-name="{{ strtolower($master->nama_pekerjaan) }}">
                                    <input type="checkbox" name="master_pekerjaan_ids[]" value="{{ $master->id }}"
                                        data-durasi="{{ $master->total_durasi_hari }}"
                                        class="master-check mt-0.5 rounded text-indigo-600 focus:ring-indigo-500"
                                        {{ is_array(old('master_pekerjaan_ids')) && in_array($master->id, old('master_pekerjaan_ids')) ? 'checked' : '' }}>
                                    <div>
                                        <p class="text-sm font-bold text-gray-800">{{ $master->nama_pekerjaan }}</p>
                                        <p class="text-xs text-gray-400">{{ $master->kode_pekerjaan }} &bull; {{ $master->total_durasi_hari }} Hari</p>
                                    </div>
                                </label>
                                @endforeach
                            </div>

                            <!-- Selected summary -->
                            <div id="selectedSummary" class="mt-4 hidden">
                                <div class="bg-indigo-50 border border-indigo-100 rounded-2xl p-4">
                                    <p class="text-xs font-black text-indigo-500 uppercase tracking-widest mb-2">Pekerjaan Terpilih (Urutan Pelaksanaan):</p>
                                    <ol id="selectedList" class="space-y-1 text-sm font-semibold text-indigo-900 list-decimal pl-5"></ol>
                                    <div class="mt-3 pt-3 border-t border-indigo-100 flex gap-8 text-xs font-bold text-indigo-700">
                                        <span>Total Durasi: <span id="totalDurasi" class="font-black text-indigo-900">0</span> Hari</span>
                                        <span>Tanggal Selesai: <span id="tglSelesai" class="font-black text-indigo-900">—</span></span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="flex items-center justify-end mt-10 gap-6 pt-6 border-t border-gray-50">
                            <a href="{{ route('projects.index') }}" class="text-xs font-black text-gray-400 hover:text-gray-900 transition uppercase tracking-widest">Batal</a>
                            <button type="submit" class="bg-indigo-600 hover:bg-indigo-700 text-white font-black rounded-2xl py-3 px-8 shadow-indigo-200 shadow-lg hover:shadow-indigo-300 transition-all duration-300 text-sm uppercase tracking-widest">
                                SIMPAN PROYEK 🚀
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        const checkboxes = document.querySelectorAll('.master-check');
        const selectedList = document.getElementById('selectedList');
        const selectedSummary = document.getElementById('selectedSummary');
        const totalDurasiEl = document.getElementById('totalDurasi');
        const tglSelesaiEl = document.getElementById('tglSelesai');

        function updateSummary() {
            const checked = [...checkboxes].filter(c => c.checked);
            if (checked.length === 0) {
                selectedSummary.classList.add('hidden');
                return;
            }
            selectedSummary.classList.remove('hidden');
            selectedList.innerHTML = '';
            let total = 0;
            checked.forEach(c => {
                const label = c.closest('label');
                const name = label.querySelector('p.font-bold').textContent.trim();
                const durasi = parseInt(c.dataset.durasi || 0);
                total += durasi;
                const li = document.createElement('li');
                li.textContent = name + ' (' + durasi + ' hari)';
                selectedList.appendChild(li);
            });
            totalDurasiEl.textContent = total;

            const mulai = document.getElementById('tanggal_mulai').value;
            if (mulai && total > 0) {
                const d = new Date(mulai);
                d.setDate(d.getDate() + total);
                tglSelesaiEl.textContent = d.toLocaleDateString('id-ID', {day:'2-digit',month:'long',year:'numeric'});
            } else {
                tglSelesaiEl.textContent = '—';
            }
        }

        checkboxes.forEach(c => c.addEventListener('change', updateSummary));
        document.getElementById('tanggal_mulai').addEventListener('change', updateSummary);

        // Search
        document.getElementById('searchMaster').addEventListener('input', function() {
            const q = this.value.toLowerCase();
            document.querySelectorAll('.master-item').forEach(item => {
                item.style.display = item.dataset.name.includes(q) ? '' : 'none';
            });
        });

        window.addEventListener('load', updateSummary);
    </script>
</x-app-layout>
