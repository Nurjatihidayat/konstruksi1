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
                            <div id="masterList" class="flex flex-col gap-4 max-h-96 overflow-y-auto border border-gray-100 rounded-2xl p-4 bg-gray-50">
                                @foreach($masterPekerjaans as $master)
                                <div class="master-item bg-white shadow-sm border border-gray-100 rounded-xl p-4 transition" data-name="{{ strtolower($master->nama_pekerjaan) }}">
                                    <label class="flex items-start gap-3 cursor-pointer">
                                        <input type="checkbox" name="master_pekerjaan_ids[]" value="{{ $master->id }}"
                                            class="master-check mt-0.5 rounded text-indigo-600 focus:ring-indigo-500"
                                            {{ is_array(old('master_pekerjaan_ids')) && in_array($master->id, old('master_pekerjaan_ids')) ? 'checked' : '' }}>
                                        <div>
                                            <p class="text-sm font-bold text-gray-800 master-name">{{ $master->nama_pekerjaan }}</p>
                                            <p class="text-xs text-gray-400">{{ $master->kode_pekerjaan }}</p>
                                        </div>
                                    </label>
                                    
                                    <!-- Detail Pekerjaans (Sub-Pekerjaan) -->
                                    <div class="mt-3 ml-7 space-y-2 detail-container">
                                        @foreach($master->detailPekerjaans as $detail)
                                        <label class="flex items-center gap-3 cursor-pointer border-t border-gray-50 pt-2">
                                            <input type="checkbox" name="detail_pekerjaan_ids[]" value="{{ $detail->id }}"
                                                data-durasi="{{ $detail->durasi_hari }}"
                                                data-master-id="{{ $master->id }}"
                                                class="detail-check rounded text-blue-500 focus:ring-blue-400"
                                                {{ is_array(old('detail_pekerjaan_ids')) && in_array($detail->id, old('detail_pekerjaan_ids')) ? 'checked' : '' }}>
                                            <div class="text-xs text-gray-700 font-medium detail-name">{{ $detail->nama_detail_pekerjaan }}</div>
                                            <div class="text-[10px] text-gray-400 ml-auto whitespace-nowrap">{{ $detail->durasi_hari }} Hari</div>
                                        </label>
                                        @endforeach
                                    </div>
                                </div>
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
        const masterCheckboxes = document.querySelectorAll('.master-check');
        const detailCheckboxes = document.querySelectorAll('.detail-check');
        const selectedList = document.getElementById('selectedList');
        const selectedSummary = document.getElementById('selectedSummary');
        const totalDurasiEl = document.getElementById('totalDurasi');
        const tglSelesaiEl = document.getElementById('tglSelesai');

        // Auto-check details when master is checked
        masterCheckboxes.forEach(mc => {
            mc.addEventListener('change', function() {
                const container = this.closest('.master-item').querySelector('.detail-container');
                if (container) {
                    const dcs = container.querySelectorAll('.detail-check');
                    dcs.forEach(dc => dc.checked = this.checked);
                }
                updateSummary();
            });
        });

        // Update master checkbox state when details change
        detailCheckboxes.forEach(dc => {
            dc.addEventListener('change', function() {
                const item = this.closest('.master-item');
                const mc = item.querySelector('.master-check');
                const anyChecked = item.querySelectorAll('.detail-check:checked').length > 0;
                mc.checked = anyChecked;
                updateSummary();
            });
        });

        function updateSummary() {
            const checkedDetails = [...detailCheckboxes].filter(c => c.checked);
            if (checkedDetails.length === 0) {
                selectedSummary.classList.add('hidden');
                totalDurasiEl.textContent = '0';
                tglSelesaiEl.textContent = '—';
                return;
            }
            selectedSummary.classList.remove('hidden');
            selectedList.innerHTML = '';
            
            let total = 0;
            const grouped = {};
            
            checkedDetails.forEach(dc => {
                const masterId = dc.dataset.masterId;
                if (!grouped[masterId]) {
                    const masterName = dc.closest('.master-item').querySelector('.master-name').textContent.trim();
                    grouped[masterId] = { name: masterName, details: [], totalDurasi: 0 };
                }
                const detailName = dc.closest('label').querySelector('.detail-name').textContent.trim();
                const durasi = parseInt(dc.dataset.durasi || 0);
                grouped[masterId].details.push(detailName + ' (' + durasi + ' hr)');
                grouped[masterId].totalDurasi += durasi;
                total += durasi;
            });

            for (const [mid, group] of Object.entries(grouped)) {
                const li = document.createElement('li');
                li.innerHTML = `<strong>${group.name}</strong> <span class="text-xs text-gray-500">(${group.totalDurasi} hr)</span>
                                <ul class="list-disc pl-5 text-xs text-gray-600 mt-1 mb-3"><li>${group.details.join('</li><li>')}</li></ul>`;
                selectedList.appendChild(li);
            }

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
