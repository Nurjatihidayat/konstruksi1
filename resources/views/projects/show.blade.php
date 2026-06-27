<x-app-layout>
    <x-slot name="header">
        <h2 class="font-black text-2xl text-gray-800 leading-tight tracking-tighter uppercase">
            🏗️ Detail Proyek: {{ $project->nama_proyek }}
        </h2>
    </x-slot>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .gantt-cell { width: 38px; min-width: 38px; text-align: center; }
        .gantt-active { background: #22c55e; border-radius: 4px; }
        .day-berjalan { background: #22c55e; color: #fff; }
        .day-libur { background: #facc15; color: #92400e; }
        .day-future { background: #f3f4f6; color: #9ca3af; }
    </style>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8 space-y-6">

            @if(session('success'))
            <div class="bg-emerald-50 border-l-8 border-emerald-500 p-4 rounded-xl shadow-md">
                <p class="text-emerald-700 text-sm font-bold">{{ session('success') }}</p>
            </div>
            @endif

            {{-- ===== PROGRESS BANNER ===== --}}
            <div class="rounded-3xl shadow-md p-6 flex items-center justify-between
                {{ $progresOtomatis >= 100 ? 'bg-emerald-50 border-l-8 border-emerald-500' : 'bg-amber-50 border-l-8 border-amber-500' }}">
                <div>
                    <h4 class="font-black uppercase text-sm tracking-widest mb-1
                        {{ $progresOtomatis >= 100 ? 'text-emerald-800' : 'text-amber-800' }}">
                        Status: {{ $progresOtomatis >= 100 ? 'Proyek Selesai ✓' : 'Sedang Berjalan' }}
                    </h4>
                    <p class="text-xs font-semibold {{ $progresOtomatis >= 100 ? 'text-emerald-700' : 'text-amber-700' }}">
                        {{ $hariKerja = $project->dailyLogs->where('status','berjalan')->count() }} hari kerja dari {{ $project->durasi_hari }} hari rencana
                    </p>
                </div>
                <span class="text-4xl font-black {{ $progresOtomatis >= 100 ? 'text-emerald-600' : 'text-amber-600' }}">
                    {{ $progresOtomatis }}%
                </span>
            </div>

            {{-- ===== INFO PROYEK ===== --}}
            <div class="bg-white shadow-2xl rounded-3xl border border-gray-100 p-8">
                <div class="flex justify-between items-start mb-6 pb-4 border-b border-gray-50">
                    <div>
                        <h3 class="text-xl font-black text-indigo-900 uppercase tracking-tighter mb-3">Informasi Proyek</h3>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-x-12 gap-y-2 text-sm">
                            <p class="text-gray-500 font-bold"><span class="text-indigo-400">KODE:</span> {{ $project->kode_proyek ?? '-' }}</p>
                            <p class="text-gray-500 font-bold"><span class="text-indigo-400">LOKASI:</span> {{ $project->lokasi }}</p>
                            <p class="text-gray-500 font-bold"><span class="text-indigo-400">MANAGER:</span> {{ $project->manager->name ?? 'N/A' }}</p>
                            <p class="text-gray-500 font-bold"><span class="text-indigo-400">PERIODE:</span>
                                {{ \Carbon\Carbon::parse($project->tanggal_mulai)->format('d M Y') }}
                                <span class="text-pink-400">>>></span>
                                {{ \Carbon\Carbon::parse($project->tanggal_selesai)->format('d M Y') }}
                                ({{ $project->durasi_hari }} Hari)
                            </p>
                        </div>
                    </div>
                    @if(Auth::user()->role == 'admin' || (Auth::user()->role == 'manajer' && $project->manager_id == auth()->id()))
                    <a href="{{ route('projects.edit', $project) }}"
                        class="bg-amber-500 hover:bg-amber-600 text-white px-6 py-3 rounded-2xl text-xs font-black uppercase tracking-widest shadow-lg transition transform hover:-translate-y-1">
                        EDIT DATA
                    </a>
                    @endif
                </div>

                {{-- Master Pekerjaan terpilih --}}
                <h4 class="text-sm font-black text-indigo-800 uppercase tracking-widest mb-3">📋 Master Pekerjaan</h4>
                <div class="space-y-2">
                    @foreach($project->projectMasterPekerjaans as $pmp)
                    <div class="flex items-center gap-4 bg-indigo-50 rounded-2xl px-5 py-3">
                        <span class="w-7 h-7 bg-indigo-600 text-white rounded-full flex items-center justify-center text-xs font-black">{{ $pmp->urutan }}</span>
                        <div class="flex-1">
                            <p class="font-bold text-indigo-900 text-sm">{{ $pmp->masterPekerjaan->nama_pekerjaan }}</p>
                            <p class="text-xs text-indigo-500">{{ $pmp->masterPekerjaan->kode_pekerjaan }} &bull; {{ $pmp->masterPekerjaan->total_durasi_hari }} hari</p>
                        </div>
                        <div class="text-right text-xs text-indigo-600 font-semibold">
                            {{ \Carbon\Carbon::parse($pmp->tanggal_mulai_rencana)->format('d M Y') }} –
                            {{ \Carbon\Carbon::parse($pmp->tanggal_selesai_rencana)->format('d M Y') }}
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>

            {{-- ===== GANTT CHART ===== --}}
            <div class="bg-white shadow-2xl rounded-3xl border border-gray-100 p-8">
                <h3 class="text-xl font-black text-indigo-900 uppercase tracking-tighter mb-6">📅 Jadwal Pelaksanaan (MPS)</h3>
                @php
                    $tanggalMulaiProyek = \Carbon\Carbon::parse($project->tanggal_mulai);
                    $totalMinggu = ceil($project->durasi_hari / 7) + 1;
                @endphp
                <div class="overflow-x-auto">
                    <table class="text-xs border-collapse w-full">
                        <thead>
                            <tr class="bg-gray-50">
                                <th class="px-3 py-2 text-left font-black text-gray-600 uppercase tracking-widest min-w-[200px]">Paket Pekerjaan</th>
                                <th class="px-3 py-2 text-left font-black text-gray-600 uppercase tracking-widest min-w-[160px]">Sub-Pekerjaan</th>
                                @for($w = 1; $w <= $totalMinggu; $w++)
                                <th class="gantt-cell py-2 font-black text-gray-500">W{{ $w }}</th>
                                @endfor
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-50">
                            @foreach($project->projectMasterPekerjaans as $pmp)
                                @php
                                    $masterMulai = \Carbon\Carbon::parse($pmp->tanggal_mulai_rencana);
                                    $masterSelesai = \Carbon\Carbon::parse($pmp->tanggal_selesai_rencana);
                                    $details = $pmp->masterPekerjaan->detailPekerjaans;
                                    $detailCount = $details->count();
                                    // calculate start week offset and span
                                    $startDayOffset = $tanggalMulaiProyek->diffInDays($masterMulai);
                                    $startWeek = floor($startDayOffset / 7) + 1;
                                    $spanWeeks  = ceil($pmp->masterPekerjaan->total_durasi_hari / 7);
                                @endphp
                                @foreach($details as $di => $detail)
                                <tr class="hover:bg-gray-50">
                                    @if($di === 0)
                                    <td class="px-3 py-2 font-black text-indigo-700 align-top" rowspan="{{ $detailCount }}">
                                        {{ $pmp->masterPekerjaan->nama_pekerjaan }}
                                    </td>
                                    @endif
                                    <td class="px-3 py-2 text-gray-700">{{ $detail->nama_detail_pekerjaan }}</td>
                                    @php
                                        // Each detail gets roughly proportional weeks
                                        $detailStartWeek = $startWeek;
                                        $detailSpanWeeks = max(1, round($spanWeeks / $detailCount));
                                        // offset by index
                                        $detailStartWeek += $di * $detailSpanWeeks;
                                    @endphp
                                    @for($w = 1; $w <= $totalMinggu; $w++)
                                    <td class="gantt-cell py-1">
                                        @if($w >= $detailStartWeek && $w < $detailStartWeek + $detailSpanWeeks)
                                        <div class="gantt-active h-5 mx-1"></div>
                                        @endif
                                    </td>
                                    @endfor
                                </tr>
                                @endforeach
                            @endforeach
                        </tbody>
                    </table>
                </div>
                <div class="mt-3 flex gap-6 text-xs font-semibold text-gray-500">
                    <span class="flex items-center gap-2"><span class="w-4 h-4 rounded bg-green-500 inline-block"></span> Minggu aktif pekerjaan</span>
                </div>
            </div>

            {{-- ===== INVENTARIS MATERIAL ===== --}}
            <div class="bg-white shadow-2xl rounded-3xl border border-gray-100 p-8">
                <div class="flex justify-between items-center mb-6 pb-4 border-b border-gray-50">
                    <h3 class="text-xl font-black text-indigo-900 uppercase tracking-tighter">📦 Inventaris Material</h3>
                </div>
                <div class="overflow-x-auto" x-data="{ openModal: null, materialId: null, materialName: '' }">
                    <table class="w-full text-left font-sans text-sm">
                        <thead class="bg-gray-50">
                            <tr>
                                <th class="px-4 py-3 text-[10px] font-black text-gray-400 uppercase tracking-widest">Material</th>
                                <th class="px-4 py-3 text-[10px] font-black text-gray-400 uppercase tracking-widest text-center">Kebutuhan</th>
                                <th class="px-4 py-3 text-[10px] font-black text-gray-400 uppercase tracking-widest text-center">Di Lokasi</th>
                                <th class="px-4 py-3 text-[10px] font-black text-gray-400 uppercase tracking-widest text-center">Sisa Kebutuhan</th>
                                @if(Auth::user()->role !== 'admin')
                                <th class="px-4 py-3 text-[10px] font-black text-gray-400 uppercase tracking-widest text-center">Aksi</th>
                                @endif
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-50">
                            @forelse($project->projectMaterials as $pm)
                            <tr class="hover:bg-gray-50">
                                <td class="px-4 py-3">
                                    <p class="font-bold text-gray-800">{{ $pm->material->nama_material }}</p>
                                    <p class="text-xs text-gray-400">{{ $pm->material->satuan }}</p>
                                </td>
                                <td class="px-4 py-3 text-center font-bold text-gray-700">{{ $pm->jumlah_rencana ?? '-' }}</td>
                                <td class="px-4 py-3 text-center">
                                    <span class="font-black {{ $pm->jumlah_tersedia > 0 ? 'text-emerald-600' : 'text-red-500' }}">
                                        {{ $pm->jumlah_tersedia }}
                                    </span>
                                </td>
                                <td class="px-4 py-3 text-center font-bold text-gray-500">{{ max(0, ($pm->jumlah_rencana ?? 0) - ($pm->jumlah_tersedia ?? 0)) }}</td>
                                @if(Auth::user()->role === 'admin' || 
                                    (Auth::user()->role === 'manajer' && $project->manager_id === Auth::id()) || 
                                    (Auth::user()->role === 'gudang' && $project->id === Auth::user()->assigned_project_id))
                                <td class="px-4 py-3 text-center">
                                    <button @click="openModal = 'order'; materialId = {{ $pm->material_id }}; materialName = '{{ $pm->material->nama_material }}'"
                                        class="text-xs font-black text-indigo-600 hover:text-indigo-900 uppercase tracking-widest mr-3">Pesan</button>
                                    <a href="{{ route('projects.materials.edit', [$project, $pm->material_id]) }}"
                                        class="text-xs font-black text-amber-600 hover:text-amber-900 uppercase tracking-widest">Edit</a>
                                </td>
                                @else
                                <td class="px-4 py-3 text-center">-</td>
                                @endif
                            </tr>
                            @empty
                            <tr><td colspan="5" class="px-4 py-8 text-center text-gray-400 italic font-bold">Belum ada material ditambahkan</td></tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>

            {{-- ===== KALENDER LOG HARIAN ===== --}}
            <div class="bg-white shadow-2xl rounded-3xl border border-gray-100 p-8">
                <h3 class="text-xl font-black text-indigo-900 uppercase tracking-tighter mb-2">📆 Riwayat Hari Kerja</h3>
                <p class="text-xs text-gray-400 font-semibold mb-6">
                    <span class="inline-flex items-center gap-1 mr-4"><span class="w-3 h-3 rounded bg-green-500 inline-block"></span> Berjalan</span>
                    <span class="inline-flex items-center gap-1"><span class="w-3 h-3 rounded bg-yellow-400 inline-block"></span> Libur / Hujan</span>
                </p>

                @php
                    $logsByDate = $project->dailyLogs->keyBy('tanggal');
                    $startDate  = \Carbon\Carbon::parse($project->tanggal_mulai);
                    $endDate    = \Carbon\Carbon::parse($project->tanggal_selesai);
                    $today      = \Carbon\Carbon::today();
                    // Group by week
                    $weeks = [];
                    $cur = $startDate->copy()->startOfWeek(\Carbon\Carbon::MONDAY);
                    while ($cur->lte($endDate)) {
                        $week = [];
                        for ($d = 0; $d < 7; $d++) {
                            $week[] = $cur->copy();
                            $cur->addDay();
                        }
                        $weeks[] = $week;
                    }
                @endphp

                <div class="overflow-x-auto">
                    <table class="text-xs border-collapse">
                        <thead>
                            <tr>
                                <th class="px-2 py-1 text-gray-400 font-black uppercase w-12">Minggu</th>
                                @foreach(['Sen','Sel','Rab','Kam','Jum','Sab','Min'] as $d)
                                <th class="px-1 py-1 text-gray-400 font-bold w-10 text-center">{{ $d }}</th>
                                @endforeach
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($weeks as $wi => $week)
                            <tr>
                                <td class="px-2 py-1 font-black text-gray-400 text-center">W{{ $wi+1 }}</td>
                                @foreach($week as $day)
                                @php
                                    $dateStr = $day->toDateString();
                                    $log = $logsByDate[$dateStr] ?? null;
                                    $isInProject = $day->between($startDate, $endDate);
                                    $isFuture    = $day->gt($today);
                                @endphp
                                <td class="px-1 py-1 text-center">
                                    @if(!$isInProject)
                                    <span class="flex items-center justify-center w-8 h-8 rounded-lg text-gray-200 text-[10px]">{{ $day->format('d') }}</span>
                                    @elseif($log && $log->status === 'berjalan')
                                    <span class="flex items-center justify-center w-8 h-8 rounded-lg bg-green-500 text-white font-black day-berjalan" title="{{ $log->description ?? 'Berjalan' }}">{{ $day->format('d') }}</span>
                                    @elseif($log && $log->status === 'libur')
                                    <span class="flex items-center justify-center w-8 h-8 rounded-lg bg-yellow-400 text-yellow-900 font-black day-libur" title="{{ $log->keterangan ?? 'Libur' }}">{{ $day->format('d') }}</span>
                                    @elseif($isFuture)
                                    <span class="flex items-center justify-center w-8 h-8 rounded-lg bg-gray-100 text-gray-400 text-[10px]">{{ $day->format('d') }}</span>
                                    @else
                                    <span class="flex items-center justify-center w-8 h-8 rounded-lg bg-red-50 text-red-300 font-bold text-[10px]" title="Tidak ada log">{{ $day->format('d') }}</span>
                                    @endif
                                </td>
                                @endforeach
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>

            {{-- ===== FORM UPDATE HARIAN ===== --}}
            @if(Auth::user()->role == 'manajer' && $project->manager_id == auth()->id() || Auth::user()->role == 'admin')
            <div class="bg-white shadow-2xl rounded-3xl border border-gray-100 p-8" x-data="{ open: {{ $todayLog ? 'true' : 'false' }} }">
                <div class="flex justify-between items-center">
                    <div>
                        <h3 class="text-xl font-black text-indigo-900 uppercase tracking-tighter">📝 Update Harian</h3>
                        @if($todayLog)
                        <p class="text-xs text-emerald-600 font-bold mt-1">
                            ✓ Sudah diisi hari ini —
                            <span class="{{ $todayLog->status === 'berjalan' ? 'text-green-600' : 'text-yellow-600' }} font-black">
                                {{ $todayLog->status === 'berjalan' ? '🟢 Berjalan' : '🟡 Libur/Hujan' }}
                            </span>
                        </p>
                        @endif
                    </div>
                    <button @click="open = !open"
                        class="bg-indigo-50 text-indigo-700 hover:bg-indigo-100 px-4 py-2 rounded-xl text-xs font-black uppercase tracking-widest transition">
                        <span x-text="open ? 'TUTUP' : '{{ $todayLog ? 'EDIT LOG HARI INI' : 'ISI LOG HARI INI' }}'"></span>
                    </button>
                </div>

                <div x-show="open" x-transition class="mt-6 border-t border-gray-50 pt-6">
                    <form action="{{ route('projects.daily-log.store', $project) }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="grid grid-cols-1 md:grid-cols-3 gap-5 mb-5">

                            <!-- Tanggal -->
                            <div>
                                <label class="block text-[10px] font-black text-gray-400 uppercase tracking-widest mb-2">Tanggal <span class="text-red-500">*</span></label>
                                <input type="date" name="tanggal" required value="{{ $todayLog ? $todayLog->tanggal : date('Y-m-d') }}"
                                    class="w-full bg-gray-50 border-transparent rounded-2xl focus:ring-indigo-500 focus:bg-white shadow-inner text-sm">
                            </div>

                            <!-- Status Hari -->
                            <div>
                                <label class="block text-[10px] font-black text-gray-400 uppercase tracking-widest mb-2">Status Hari <span class="text-red-500">*</span></label>
                                <select name="status" required id="statusSelect"
                                    class="w-full bg-gray-50 border-transparent rounded-2xl focus:ring-indigo-500 focus:bg-white shadow-inner text-sm">
                                    <option value="berjalan" {{ (!$todayLog || $todayLog->status==='berjalan') ? 'selected' : '' }}>🟢 Berjalan</option>
                                    <option value="libur" {{ ($todayLog && $todayLog->status==='libur') ? 'selected' : '' }}>🟡 Libur / Hujan</option>
                                </select>
                            </div>

                            <!-- Keterangan libur -->
                            <div id="keteranganDiv">
                                <label class="block text-[10px] font-black text-gray-400 uppercase tracking-widest mb-2">Keterangan</label>
                                <input type="text" name="keterangan" value="{{ $todayLog->keterangan ?? '' }}"
                                    placeholder="Contoh: Hujan deras, Libur nasional..."
                                    class="w-full bg-gray-50 border-transparent rounded-2xl focus:ring-indigo-500 focus:bg-white shadow-inner text-sm">
                            </div>
                        </div>

                        <!-- Deskripsi (for berjalan days) -->
                        <div id="descDiv" class="mb-5">
                            <label class="block text-[10px] font-black text-gray-400 uppercase tracking-widest mb-2">Deskripsi Pekerjaan</label>
                            <textarea name="description" rows="2"
                                class="w-full bg-gray-50 border-transparent rounded-2xl focus:ring-indigo-500 focus:bg-white shadow-inner text-sm"
                                placeholder="Apa yang dikerjakan hari ini?">{{ $todayLog->description ?? '' }}</textarea>
                        </div>

                        <!-- Material Usage -->
                        <div id="materialSection" class="bg-slate-50 p-5 rounded-3xl mb-5">
                            <div class="flex justify-between items-center mb-4">
                                <h4 class="text-xs font-black text-indigo-900 uppercase tracking-widest">📦 Pemakaian Material Hari Ini</h4>
                                <button type="button" id="addUsageItem"
                                    class="text-[10px] font-black text-indigo-600 uppercase tracking-widest hover:text-indigo-900">
                                    + Tambah Material
                                </button>
                            </div>
                            <div id="usageContainer" class="space-y-3"></div>
                        </div>

                        <div class="flex justify-between items-center">
                            <div>
                                <label class="block text-[10px] font-black text-gray-400 uppercase tracking-widest mb-1">Foto Dokumentasi</label>
                                <input type="file" name="photo" accept="image/*" class="text-xs text-gray-400">
                            </div>
                            <button type="submit"
                                class="bg-indigo-600 hover:bg-indigo-700 text-white px-8 py-3 rounded-2xl text-xs font-black uppercase tracking-widest shadow-lg shadow-indigo-200 transition transform hover:-translate-y-1">
                                SIMPAN LOG HARIAN
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            @php
                $materialOptions = $projectMaterials->map(function($pm) {
                    return [
                        'id'        => $pm->material_id,
                        'nama'      => $pm->material->nama_material,
                        'satuan'    => $pm->material->satuan,
                        'tersedia'  => $pm->jumlah_tersedia,
                    ];
                });
            @endphp
            <script>
                const projectMaterials = @json($materialOptions);
                let usageIdx = 0;

                function buildMaterialOptions() {
                    let opts = '<option value="">-- Pilih Material --<\/option>';
                    projectMaterials.forEach(function(m) {
                        opts += '<option value="' + m.id + '">' + m.nama + ' (Tersedia: ' + m.tersedia + ' ' + m.satuan + ')<\/option>';
                    });
                    return opts;
                }

                function addUsageRow() {
                    const c = document.getElementById('usageContainer');
                    const d = document.createElement('div');
                    d.className = 'grid grid-cols-12 gap-3 items-end bg-white p-3 rounded-2xl shadow-sm border border-gray-100';
                    d.innerHTML =
                        '<div class="col-span-7">' +
                            '<select name="materials[' + usageIdx + '][material_id]" class="w-full border-transparent bg-gray-50 rounded-xl text-xs focus:ring-indigo-500">' +
                                buildMaterialOptions() +
                            '<\/select>' +
                        '<\/div>' +
                        '<div class="col-span-3">' +
                            '<input type="number" name="materials[' + usageIdx + '][quantity]" placeholder="Qty" min="0.01" step="0.01" class="w-full border-transparent bg-gray-50 rounded-xl text-xs focus:ring-indigo-500">' +
                        '<\/div>' +
                        '<div class="col-span-2 flex justify-end">' +
                            '<button type="button" class="remove-usage text-red-400 hover:text-red-600 transition text-xs font-black">&#x2715;<\/button>' +
                        '<\/div>';
                    c.appendChild(d);
                    d.querySelector('.remove-usage').onclick = function() { d.remove(); };
                    usageIdx++;
                }
                document.getElementById('addUsageItem').onclick = addUsageRow;

                // Toggle material section based on status
                const statusSel = document.getElementById('statusSelect');
                function toggleSections() {
                    const isBerjalan = statusSel.value === 'berjalan';
                    document.getElementById('materialSection').style.display = isBerjalan ? '' : 'none';
                    document.getElementById('descDiv').style.display = isBerjalan ? '' : 'none';
                }
                statusSel.addEventListener('change', toggleSections);
                toggleSections();
            </script>
            @endif

            {{-- ===== RIWAYAT LOG HARIAN ===== --}}
            <div class="bg-white shadow-2xl rounded-3xl border border-gray-100 p-8">
                <h3 class="text-xl font-black text-indigo-900 uppercase tracking-tighter mb-6 pb-4 border-b border-gray-50">
                    🕒 Riwayat Log Harian
                </h3>
                <div class="space-y-4">
                    @forelse($project->dailyLogs as $log)
                    <div class="flex gap-4 items-start p-4 rounded-2xl {{ $log->status === 'berjalan' ? 'bg-green-50 border border-green-100' : 'bg-yellow-50 border border-yellow-100' }}">
                        <div class="w-10 h-10 rounded-full flex items-center justify-center text-lg shrink-0
                            {{ $log->status === 'berjalan' ? 'bg-green-500 text-white' : 'bg-yellow-400 text-yellow-900' }}">
                            {{ $log->status === 'berjalan' ? '🟢' : '🟡' }}
                        </div>
                        <div class="flex-1">
                            <div class="flex justify-between items-start">
                                <div>
                                    <p class="font-black text-sm {{ $log->status === 'berjalan' ? 'text-green-800' : 'text-yellow-800' }}">
                                        {{ \Carbon\Carbon::parse($log->tanggal)->translatedFormat('l, d F Y') }}
                                        <span class="ml-2 text-xs font-bold px-2 py-0.5 rounded-full {{ $log->status === 'berjalan' ? 'bg-green-200 text-green-800' : 'bg-yellow-200 text-yellow-800' }}">
                                            {{ $log->status === 'berjalan' ? 'BERJALAN' : 'LIBUR/HUJAN' }}
                                        </span>
                                    </p>
                                    @if($log->keterangan)
                                    <p class="text-xs text-gray-500 mt-1">⚠️ {{ $log->keterangan }}</p>
                                    @endif
                                    @if($log->description)
                                    <p class="text-xs text-gray-600 italic mt-1">"{{ $log->description }}"</p>
                                    @endif
                                </div>
                                <p class="text-xs text-gray-400 font-semibold shrink-0">{{ $log->manager->name ?? '-' }}</p>
                            </div>

                            @if($log->materialUsages->count() > 0)
                            <div class="mt-3 bg-white rounded-xl p-3 inline-block">
                                <p class="text-[9px] font-black text-gray-400 uppercase tracking-widest mb-2">Material Digunakan:</p>
                                <ul class="space-y-1">
                                    @foreach($log->materialUsages as $usage)
                                    <li class="text-xs font-bold text-gray-700 flex justify-between gap-6">
                                        <span>{{ $usage->material->nama_material }}</span>
                                        <span class="text-indigo-600">{{ $usage->quantity_used }} {{ $usage->material->satuan }}</span>
                                    </li>
                                    @endforeach
                                </ul>
                            </div>
                            @endif
                        </div>
                    </div>
                    @empty
                    <p class="text-center py-8 text-gray-400 font-bold italic uppercase tracking-widest">-- Belum ada log harian --</p>
                    @endforelse
                </div>
            </div>

            <div class="flex justify-start">
                <a href="{{ route('projects.index') }}"
                    class="text-[10px] font-black text-indigo-400 hover:text-indigo-900 flex items-center transition uppercase tracking-widest">
                    <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"/>
                    </svg>
                    KEMBALI KE LIST PROYEK
                </a>
            </div>

        </div>
    </div>
</x-app-layout>
