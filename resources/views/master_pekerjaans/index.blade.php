<x-app-layout>
    <x-slot name="header">
        <h2 class="font-black text-2xl text-gray-800 leading-tight tracking-tighter uppercase">
            {{ __('🔧 Master Pekerjaan') }}
        </h2>
    </x-slot>

    <!-- Load Bootstrap 5 & DataTables CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css" rel="stylesheet">
    <style>
        /* To prevent conflict with tailwind where possible */
        .tw-reset { all: revert; }
    </style>

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
                            <h4 class="card-title mb-0 fw-bold text-primary text-uppercase">Daftar Master Pekerjaan</h4>
                            <p class="text-muted small mb-0 mt-1">Kelola hierarki pekerjaan: Master → Detail → Material</p>
                        </div>
                        <a href="{{ route('master-pekerjaans.create') }}" class="btn btn-primary fw-bold text-uppercase rounded-pill px-4 shadow-sm">
                            + Tambah Pekerjaan
                        </a>
                    </div>

                    <div class="table-responsive">
                        <table id="masterTable" class="table table-hover align-middle w-100">
                            <thead class="table-light">
                                <tr>
                                    <th class="text-uppercase small fw-bold">Kode</th>
                                    <th class="text-uppercase small fw-bold">Nama Pekerjaan</th>
                                    <th class="text-uppercase small fw-bold">Kategori</th>
                                    <th class="text-uppercase small fw-bold text-center">Durasi (Hari)</th>
                                    <th class="text-uppercase small fw-bold text-center">Jml Detail</th>
                                    <th class="text-uppercase small fw-bold text-center">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($masterPekerjaans as $item)
                                <tr>
                                    <td class="fw-bold">{{ $item->kode_pekerjaan }}</td>
                                    <td>
                                        <div class="fw-bold text-dark">{{ $item->nama_pekerjaan }}</div>
                                        @if($item->keterangan)
                                        <div class="text-muted small">{{ Str::limit($item->keterangan, 50) }}</div>
                                        @endif
                                    </td>
                                    <td><span class="badge bg-secondary">{{ $item->kategori }}</span></td>
                                    <td class="text-center">
                                        <span class="badge bg-info text-dark">⏱ {{ $item->total_durasi_hari }} Hari</span>
                                    </td>
                                    <td class="text-center">
                                        <span class="badge bg-light text-dark border">{{ $item->detail_pekerjaans_count }} detail</span>
                                    </td>
                                    <td class="text-center">
                                        <div class="btn-group" role="group">
                                            <a href="{{ route('master-pekerjaans.show', $item) }}" class="btn btn-sm btn-outline-primary" title="Detail">
                                                Detail
                                            </a>
                                            <a href="{{ route('master-pekerjaans.edit', $item) }}" class="btn btn-sm btn-outline-secondary" title="Edit">
                                                Edit
                                            </a>
                                            <form action="{{ route('master-pekerjaans.destroy', $item) }}" method="POST" class="d-inline" onsubmit="return confirm('Hapus Master Pekerjaan ini?')">
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

    <!-- Load JS -->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#masterTable').DataTable({
                language: {
                    url: '//cdn.datatables.net/plug-ins/1.13.6/i18n/id.json',
                }
            });
        });
    </script>
</x-app-layout>
