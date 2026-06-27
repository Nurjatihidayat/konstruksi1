<x-app-layout>
<x-slot name="header">
<h2 class="font-black text-2xl text-gray-800 leading-tight tracking-tighter uppercase">
{{ __('📋 Pekerjaan') }}
</h2>
</x-slot>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css" rel="stylesheet">

<div class="py-12">
    <div class="max-w-7xl mx-auto sm:px-6 lg:px-8 space-y-6">

        @if(session('success'))
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong>Berhasil!</strong> {{ session('success') }}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        @endif

        <div class="card shadow-sm border-0 rounded-4">
            <div class="card-body p-4">
                <div class="d-flex justify-content-between align-items-center mb-4 pb-3 border-bottom">
                    <div>
                        <h4 class="card-title mb-0 fw-bold text-primary text-uppercase">Daftar Pekerjaan</h4>
                        <p class="text-muted small mb-0 mt-1">Kelola pelaksanaan pekerjaan dari Master Pekerjaan</p>
                    </div>
                    <a href="{{ route('pekerjaans.create') }}" class="btn btn-primary fw-bold text-uppercase rounded-pill px-4 shadow-sm">
                        + Tambah Pekerjaan
                    </a>
                </div>

                <div class="table-responsive">
                    <table id="pekerjaanTable" class="table table-hover align-middle w-100">
                        <thead class="table-light">
                            <tr>
                                <th class="text-uppercase small fw-bold">Project</th>
                                <th class="text-uppercase small fw-bold">Master Pekerjaan</th>
                                <th class="text-uppercase small fw-bold">Manajer</th>
                                <th class="text-uppercase small fw-bold text-center">Periode</th>
                                <th class="text-uppercase small fw-bold text-center">Status</th>
                                <th class="text-uppercase small fw-bold text-center">Progres</th>
                                <th class="text-uppercase small fw-bold text-center">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($pekerjaans as $item)
                            <tr>
                                <td>
                                    <div class="fw-bold">{{ $item->project->nama_proyek }}</div>
                                </td>
                                <td>
                                    <div class="fw-bold text-dark">{{ $item->masterPekerjaan->nama_pekerjaan }}</div>
                                    <div class="text-muted small">{{ $item->masterPekerjaan->kode_pekerjaan }}</div>
                                </td>
                                <td>{{ $item->manager->name }}</td>
                                <td class="text-center">
                                    <div class="small">
                                        <div>{{ \Carbon\Carbon::parse($item->tanggal_mulai)->format('d/m/Y') }}</div>
                                        <div>s/d {{ \Carbon\Carbon::parse($item->tanggal_selesai)->format('d/m/Y') }}</div>
                                    </div>
                                </td>
                                <td class="text-center">
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
                                    <span class="badge {{ $statusClass[$item->status] }}">
                                        {{ $statusLabel[$item->status] }}
                                    </span>
                                </td>
                                <td class="text-center">
                                    <div class="progress" style="height: 20px;">
                                        <div class="progress-bar bg-info" role="progressbar" 
                                             style="width: {{ $item->progres }}%" 
                                             aria-valuenow="{{ $item->progres }}" 
                                             aria-valuemin="0" 
                                             aria-valuemax="100">
                                            {{ $item->progres }}%
                                        </div>
                                    </div>
                                </td>
                                <td class="text-center">
                                    <div class="btn-group" role="group">
                                        <a href="{{ route('pekerjaans.show', $item) }}" class="btn btn-sm btn-outline-primary" title="Detail">
                                            Detail
                                        </a>
                                        <a href="{{ route('pekerjaans.edit', $item) }}" class="btn btn-sm btn-outline-secondary" title="Edit">
                                            Edit
                                        </a>
                                        <form action="{{ route('pekerjaans.destroy', $item) }}" method="POST" class="d-inline" onsubmit="return confirm('Hapus Pekerjaan ini?')">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="btn btn-sm btn-outline-danger" title="Hapus">
                                                Hapus
                                            </button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
</div>

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function() {
        $('#pekerjaanTable').DataTable({
            language: {
                url: '//cdn.datatables.net/plug-ins/1.13.6/i18n/id.json',
            }
        });
    });
</script>
</x-app-layout>