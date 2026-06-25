<x-app-layout>
    <x-slot name="header">
        <div class="d-flex align-items-center justify-content-between">
            <div>
                <h2 class="fw-bold fs-4 text-dark text-uppercase mb-0">
                    🔧 {{ $masterPekerjaan->nama_pekerjaan }}
                </h2>
                <p class="text-muted small mt-1 mb-0">
                    Kategori: <strong>{{ $masterPekerjaan->kategori }}</strong> · Durasi: <strong>{{ $masterPekerjaan->total_durasi_hari }} Hari</strong>
                </p>
            </div>
            <div class="d-flex gap-2">
                <a href="{{ route('master-pekerjaans.edit', $masterPekerjaan) }}" class="btn btn-warning fw-bold text-uppercase px-3 shadow-sm text-dark">
                    ✏️ Edit
                </a>
                <a href="{{ route('master-pekerjaans.index') }}" class="btn btn-light fw-bold text-uppercase px-3 shadow-sm border">
                    ← Kembali
                </a>
            </div>
        </div>
    </x-slot>

    <!-- Load Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* To prevent conflict with tailwind where possible */
        .tw-reset { all: revert; }
    </style>

    <div class="py-4">
        <div class="container">
            @if(session('success'))
            <div class="alert alert-success alert-dismissible fade show shadow-sm" role="alert">
                <strong>Berhasil!</strong> {{ session('success') }}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            @endif

            {{-- INFO CARD --}}
            <div class="card shadow-sm border-0 rounded-4 mb-4 bg-primary text-white">
                <div class="card-body p-4">
                    <div class="row g-4">
                        <div class="col-md-3">
                            <p class="text-white-50 text-uppercase small fw-bold mb-1">Kode</p>
                            <p class="fw-bold fs-5 mb-0">{{ $masterPekerjaan->kode_pekerjaan }}</p>
                        </div>
                        <div class="col-md-3">
                            <p class="text-white-50 text-uppercase small fw-bold mb-1">Total Durasi</p>
                            <p class="fw-bold fs-5 mb-0">{{ $masterPekerjaan->total_durasi_hari }} Hari</p>
                        </div>
                        <div class="col-md-3">
                            <p class="text-white-50 text-uppercase small fw-bold mb-1">Jumlah Detail</p>
                            <p class="fw-bold fs-5 mb-0">{{ $masterPekerjaan->detailPekerjaans->count() }}</p>
                        </div>
                    </div>
                    @if($masterPekerjaan->keterangan)
                    <div class="mt-4 pt-3 border-top border-white-50">
                        <p class="text-white-50 text-uppercase small fw-bold mb-1">Keterangan</p>
                        <p class="mb-0 small">{{ $masterPekerjaan->keterangan }}</p>
                    </div>
                    @endif
                </div>
            </div>

            {{-- TREE VIEW --}}
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-body p-4">
                    <div class="d-flex justify-content-between align-items-center mb-4 border-bottom pb-3">
                        <h4 class="card-title fw-bold text-primary text-uppercase mb-0">Detail Pekerjaan</h4>
                        <button class="btn btn-primary fw-bold text-uppercase rounded-pill shadow-sm px-3" data-bs-toggle="modal" data-bs-target="#modalTambahDetail">
                            + Tambah Detail
                        </button>
                    </div>

                    <div class="accordion" id="accordionDetailPekerjaan">
                        @forelse($masterPekerjaan->detailPekerjaans as $detail)
                        <div class="accordion-item mb-3 border rounded shadow-sm">
                            <h2 class="accordion-header" id="heading{{ $detail->id }}">
                                <button class="accordion-button collapsed fw-bold text-dark bg-light" type="button" data-bs-toggle="collapse" data-bs-target="#collapse{{ $detail->id }}" aria-expanded="false" aria-controls="collapse{{ $detail->id }}">
                                    <div class="d-flex justify-content-between w-100 me-3 align-items-center">
                                        <div>
                                            {{ $detail->nama_detail_pekerjaan }}
                                            <span class="badge bg-info text-dark ms-2">{{ $detail->durasi_hari }} Hari</span>
                                        </div>
                                    </div>
                                </button>
                            </h2>
                            <div id="collapse{{ $detail->id }}" class="accordion-collapse collapse" aria-labelledby="heading{{ $detail->id }}" data-bs-parent="#accordionDetailPekerjaan">
                                <div class="accordion-body">
                                    <div class="d-flex justify-content-between mb-3">
                                        <p class="text-muted small mb-0">{{ $detail->keterangan }}</p>
                                        <div class="btn-group btn-group-sm">
                                            <button class="btn btn-outline-warning" onclick="openEditDetail({{ $detail->id }}, '{{ addslashes($detail->nama_detail_pekerjaan) }}', {{ $detail->durasi_hari }}, '{{ addslashes($detail->satuan ?? '') }}', '{{ addslashes($detail->keterangan ?? '') }}')">✏️ Edit</button>
                                            <form action="{{ route('master-pekerjaans.details.destroy', [$masterPekerjaan, $detail]) }}" method="POST" class="d-inline" onsubmit="return confirm('Hapus detail ini beserta semua materialnya?')">
                                                @csrf @method('DELETE')
                                                <button type="submit" class="btn btn-outline-danger">🗑️ Hapus</button>
                                            </form>
                                        </div>
                                    </div>

                                    {{-- NESTED TABLE FOR MATERIAL --}}
                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                        <h6 class="fw-bold mb-0 text-secondary">Daftar Material</h6>
                                        <button class="btn btn-sm btn-outline-success fw-bold" onclick="openTambahMaterial({{ $detail->id }})">+ Tambah Material</button>
                                    </div>
                                    <div class="table-responsive">
                                        <table class="table table-sm table-bordered table-hover align-middle">
                                            <thead class="table-light">
                                                <tr>
                                                    <th>Nama Material</th>
                                                    <th>Spesifikasi</th>
                                                    <th>Qty</th>
                                                    <th>Satuan</th>
                                                    <th>Keterangan</th>
                                                    <th width="100" class="text-center">Aksi</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @forelse($detail->detailMaterials as $material)
                                                <tr>
                                                    <td class="fw-bold">{{ $material->nama_material }}</td>
                                                    <td>{{ $material->spesifikasi }}</td>
                                                    <td>{{ $material->qty }}</td>
                                                    <td>{{ $material->satuan }}</td>
                                                    <td class="small text-muted">{{ $material->keterangan }}</td>
                                                    <td class="text-center">
                                                        <div class="btn-group btn-group-sm">
                                                            <button class="btn btn-light" onclick="openEditMaterial({{ $material->id }}, {{ $detail->id }}, '{{ addslashes($material->nama_material) }}', '{{ addslashes($material->spesifikasi ?? '') }}', {{ $material->qty }}, '{{ addslashes($material->satuan ?? '') }}', '{{ addslashes($material->keterangan ?? '') }}')">✏️</button>
                                                            <form action="{{ route('detail-pekerjaans.materials.destroy', [$detail, $material]) }}" method="POST" class="d-inline" onsubmit="return confirm('Hapus material ini?')">
                                                                @csrf @method('DELETE')
                                                                <button type="submit" class="btn btn-light text-danger">🗑️</button>
                                                            </form>
                                                        </div>
                                                    </td>
                                                </tr>
                                                @empty
                                                <tr>
                                                    <td colspan="6" class="text-center text-muted small py-3">Belum ada material</td>
                                                </tr>
                                                @endforelse
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        @empty
                        <div class="text-center py-5 text-muted">
                            <div class="fs-1 mb-3">📋</div>
                            <p class="fw-bold text-uppercase mb-3">Belum ada detail pekerjaan</p>
                            <button class="btn btn-primary fw-bold text-uppercase rounded-pill" data-bs-toggle="modal" data-bs-target="#modalTambahDetail">
                                + Tambah Detail Pertama
                            </button>
                        </div>
                        @endforelse
                    </div>
                </div>
            </div>
        </div>
    </div>

    {{-- ===================== MODALS ===================== --}}

    {{-- MODAL: Tambah Detail Pekerjaan --}}
    <div class="modal fade" id="modalTambahDetail" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header border-0">
                    <h5 class="modal-title fw-bold text-uppercase">+ Tambah Detail Pekerjaan</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <form action="{{ route('master-pekerjaans.details.store', $masterPekerjaan) }}" method="POST">
                    @csrf
                    <div class="modal-body">
                        <div class="mb-3">
                            <label class="form-label fw-bold small text-uppercase">Nama Detail Pekerjaan</label>
                            <input type="text" name="nama_detail_pekerjaan" class="form-control" required placeholder="Contoh: Pemasangan Rangka">
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold small text-uppercase">Satuan</label>
                            <input type="text" name="satuan" class="form-control" placeholder="Contoh: m2">
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold small text-uppercase">Durasi (Hari)</label>
                            <input type="number" name="durasi_hari" class="form-control" min="0" value="0" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold small text-uppercase">Keterangan (Opsional)</label>
                            <textarea name="keterangan" class="form-control" rows="2"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer border-0">
                        <button type="button" class="btn btn-light fw-bold text-uppercase" data-bs-dismiss="modal">Batal</button>
                        <button type="submit" class="btn btn-primary fw-bold text-uppercase">Simpan</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    {{-- MODAL: Edit Detail Pekerjaan --}}
    <div class="modal fade" id="modalEditDetail" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header border-0">
                    <h5 class="modal-title fw-bold text-uppercase">✏️ Edit Detail Pekerjaan</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <form id="form-edit-detail" method="POST">
                    @csrf @method('PATCH')
                    <div class="modal-body">
                        <div class="mb-3">
                            <label class="form-label fw-bold small text-uppercase">Nama Detail Pekerjaan</label>
                            <input type="text" name="nama_detail_pekerjaan" id="edit-detail-nama" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold small text-uppercase">Satuan</label>
                            <input type="text" name="satuan" id="edit-detail-satuan" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold small text-uppercase">Durasi (Hari)</label>
                            <input type="number" name="durasi_hari" id="edit-detail-durasi" class="form-control" min="0" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold small text-uppercase">Keterangan</label>
                            <textarea name="keterangan" id="edit-detail-ket" class="form-control" rows="2"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer border-0">
                        <button type="button" class="btn btn-light fw-bold text-uppercase" data-bs-dismiss="modal">Batal</button>
                        <button type="submit" class="btn btn-warning fw-bold text-uppercase">Simpan</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    {{-- MODAL: Tambah Material --}}
    <div class="modal fade" id="modalTambahMaterial" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header border-0">
                    <h5 class="modal-title fw-bold text-uppercase">+ Tambah Material</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <form id="form-tambah-material" method="POST">
                    @csrf
                    <div class="modal-body">
                        <div class="mb-3">
                            <label class="form-label fw-bold small text-uppercase">Nama Material</label>
                            <input type="text" name="nama_material" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold small text-uppercase">Spesifikasi</label>
                            <input type="text" name="spesifikasi" class="form-control">
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-bold small text-uppercase">Qty</label>
                                <input type="number" name="qty" class="form-control" step="0.01" min="0" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-bold small text-uppercase">Satuan</label>
                                <input type="text" name="satuan" class="form-control">
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold small text-uppercase">Keterangan</label>
                            <textarea name="keterangan" class="form-control" rows="2"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer border-0">
                        <button type="button" class="btn btn-light fw-bold text-uppercase" data-bs-dismiss="modal">Batal</button>
                        <button type="submit" class="btn btn-success fw-bold text-uppercase text-white">Simpan</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    {{-- MODAL: Edit Material --}}
    <div class="modal fade" id="modalEditMaterial" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header border-0">
                    <h5 class="modal-title fw-bold text-uppercase">✏️ Edit Material</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <form id="form-edit-material" method="POST">
                    @csrf @method('PATCH')
                    <div class="modal-body">
                        <div class="mb-3">
                            <label class="form-label fw-bold small text-uppercase">Nama Material</label>
                            <input type="text" name="nama_material" id="edit-mat-nama" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold small text-uppercase">Spesifikasi</label>
                            <input type="text" name="spesifikasi" id="edit-mat-spek" class="form-control">
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-bold small text-uppercase">Qty</label>
                                <input type="number" name="qty" id="edit-mat-qty" class="form-control" step="0.01" min="0" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-bold small text-uppercase">Satuan</label>
                                <input type="text" name="satuan" id="edit-mat-satuan" class="form-control">
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold small text-uppercase">Keterangan</label>
                            <textarea name="keterangan" id="edit-mat-ket" class="form-control" rows="2"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer border-0">
                        <button type="button" class="btn btn-light fw-bold text-uppercase" data-bs-dismiss="modal">Batal</button>
                        <button type="submit" class="btn btn-warning fw-bold text-uppercase">Simpan</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Load Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        const routes = {
            editDetail    : (detId) => `/master-pekerjaans/{{ $masterPekerjaan->id }}/details/${detId}`,
            tambahMaterial: (detId) => `/detail-pekerjaans/${detId}/materials`,
            editMaterial  : (detId, matId) => `/detail-pekerjaans/${detId}/materials/${matId}`,
        };

        const modalEditDetail = new bootstrap.Modal(document.getElementById('modalEditDetail'));
        const modalTambahMaterial = new bootstrap.Modal(document.getElementById('modalTambahMaterial'));
        const modalEditMaterial = new bootstrap.Modal(document.getElementById('modalEditMaterial'));

        function openEditDetail(detId, nama, durasi, satuan, ket) {
            document.getElementById('edit-detail-nama').value   = nama;
            document.getElementById('edit-detail-durasi').value = durasi;
            document.getElementById('edit-detail-satuan').value = satuan;
            document.getElementById('edit-detail-ket').value    = ket;
            document.getElementById('form-edit-detail').action  = routes.editDetail(detId);
            modalEditDetail.show();
        }

        function openTambahMaterial(detId) {
            document.getElementById('form-tambah-material').action = routes.tambahMaterial(detId);
            modalTambahMaterial.show();
        }

        function openEditMaterial(matId, detId, nama, spek, qty, satuan, ket) {
            document.getElementById('edit-mat-nama').value   = nama;
            document.getElementById('edit-mat-spek').value   = spek;
            document.getElementById('edit-mat-qty').value    = qty;
            document.getElementById('edit-mat-satuan').value = satuan;
            document.getElementById('edit-mat-ket').value    = ket;
            document.getElementById('form-edit-material').action = routes.editMaterial(detId, matId);
            modalEditMaterial.show();
        }
    </script>
</x-app-layout>
