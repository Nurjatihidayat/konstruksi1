<x-app-layout>
<x-slot name="header">
<h2 class="font-black text-2xl text-gray-800 leading-tight tracking-tighter uppercase">
{{ __('📋 Detail Pekerjaan') }}
</h2>
</x-slot>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<div class="py-12">
    <div class="max-w-7xl mx-auto sm:px-6 lg:px-8 space-y-6">
        
        <!-- Info Card -->
        <div class="card shadow-sm border-0 rounded-4">
            <div class="card-body p-4">
                <div class="row">
                    <div class="col-md-8">
                        <h4 class="fw-bold text-primary mb-3">{{ $pekerjaan->masterPekerjaan->nama_pekerjaan }}</h4>
                        <p class="text-muted">{{ $pekerjaan->masterPekerjaan->kode_pekerjaan }}</p>
                    </div>
                    <div class="col-md-4 text-end">
                        @php
                            $statusClass = [
                                'belum_mulai' => 'bg-secondary',
                                'berjalan' => 'bg-primary',
                                'selesai' => 'bg-success',
                                'tertunda' => 'bg-warning text-dark'
                            ];
                            $statusLabel = [
                                'belum_mulai' => 'Belum Mulai',
                                'berjalan' => 'Berjalan',
                                'selesai' => 'Selesai',
                                'tertunda' => 'Tertunda'
                            ];
                        @endphp
                        <span class="badge {{ $statusClass[$pekerjaan->status] }} fs-6 px-3 py-2">
                            {{ $statusLabel[$pekerjaan->status] }}
                        </span>
                    </div>
                </div>

                <hr>

                <div class="row g-4">
                    <div class="col-md-6">
                        <h6 class="text-uppercase small fw-bold text-muted">Project</h6>
                        <p class="fw-bold mb-0">{{ $pekerjaan->project->nama_proyek }}</p>
                    </div>
                    <div class="col-md-6">
                        <h6 class="text-uppercase small fw-bold text-muted">Manajer</h6>
                        <p class="fw-bold mb-0">{{ $pekerjaan->manager->name }}</p>
                    </div>
                    <div class="col-md-4">
                        <h6 class="text-uppercase small fw-bold text-muted">Tanggal Mulai</h6>
                        <p class="fw-bold mb-0">{{ \Carbon\Carbon::parse($pekerjaan->tanggal_mulai)->format('d F Y') }}</p>
                    </div>
                    <div class="col-md-4">
                        <h6 class="text-uppercase small fw-bold text-muted">Tanggal Selesai</h6>
                        <p class="fw-bold mb-0">{{ \Carbon\Carbon::parse($pekerjaan->tanggal_selesai)->format('d F Y') }}</p>
                    </div>
                    <div class="col-md-4">
                        <h6 class="text-uppercase small fw-bold text-muted">Durasi Rencana</h6>
                        <p class="fw-bold mb-0">{{ $pekerjaan->durasi_rencana }} Hari</p>
                    </div>
                    <div class="col-md-12">
                        <h6 class="text-uppercase small fw-bold text-muted">Progres</h6>
                        <div class="progress" style="height: 25px;">
                            <div class="progress-bar bg-info" role="progressbar" 
                                 style="width: {{ $pekerjaan->progres }}%" 
                                 aria-valuenow="{{ $pekerjaan->progres }}" 
                                 aria-valuemin="0" 
                                 aria-valuemax="100">
                                {{ $pekerjaan->progres }}%
                            </div>
                        </div>
                    </div>
                    @if($pekerjaan->catatan)
                    <div class="col-md-12">
                        <h6 class="text-uppercase small fw-bold text-muted">Catatan</h6>
                        <p class="mb-0">{{ $pekerjaan->catatan }}</p>
                    </div>
                    @endif
                </div>
            </div>
        </div>

        <!-- Detail Pekerjaan dari Master -->
        <div class="card shadow-sm border-0 rounded-4">
            <div class="card-header bg-white border-bottom">
                <h5 class="mb-0 fw-bold text-primary">📦 Detail Pekerjaan (Dari Master)</h5>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead class="table-light">
                            <tr>
                                <th>No</th>
                                <th>Nama Detail Pekerjaan</th>
                                <th>Durasi (Hari)</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($pekerjaan->masterPekerjaan->detailPekerjaans as $index => $detail)
                            <tr>
                                <td>{{ $index + 1 }}</td>
                                <td>{{ $detail->nama_detail_pekerjaan }}</td>
                                <td class="text-center">{{ $detail->durasi_hari }}</td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Detail Material dari Master -->
        <div class="card shadow-sm border-0 rounded-4">
            <div class="card-header bg-white border-bottom">
                <h5 class="mb-0 fw-bold text-primary">🛠️ Detail Material (Dari Master)</h5>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead class="table-light">
                            <tr>
                                <th>No</th>
                                <th>Detail Pekerjaan</th>
                                <th>Material</th>
                                <th>Qty</th>
                                <th>Satuan</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php $no = 1; @endphp
                            @foreach($pekerjaan->masterPekerjaan->detailPekerjaans as $detail)
                                @foreach($detail->detailMaterials as $material)
                                <tr>
                                    <td>{{ $no++ }}</td>
                                    <td>{{ $detail->nama_detail_pekerjaan }}</td>
                                    <td>{{ $material->nama_material }}</td>
                                    <td class="text-center">{{ $material->qty }}</td>
                                    <td>{{ $material->satuan }}</td>
                                </tr>
                                @endforeach
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="d-flex justify-content-end gap-3">
            <a href="{{ route('pekerjaans.index') }}" class="btn btn-secondary fw-bold text-uppercase px-4">Kembali</a>
            <a href="{{ route('pekerjaans.edit', $pekerjaan) }}" class="btn btn-primary fw-bold text-uppercase px-4">Edit</a>
        </div>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</x-app-layout>