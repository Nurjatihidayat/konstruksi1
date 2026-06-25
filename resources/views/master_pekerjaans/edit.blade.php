<x-app-layout>
    <x-slot name="header">
        <h2 class="font-black text-2xl text-gray-800 leading-tight tracking-tighter uppercase">
            {{ __('✏️ Edit Master Pekerjaan') }}: {{ $masterPekerjaan->nama_pekerjaan }}
        </h2>
    </x-slot>

    <!-- Load Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* To prevent conflict with tailwind where possible */
        .tw-reset { all: revert; }
    </style>

    <div class="py-12">
        <div class="max-w-3xl mx-auto sm:px-6 lg:px-8">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-body p-5">
                    <h4 class="card-title fw-bold text-primary text-uppercase mb-4">Form Edit Master Pekerjaan</h4>

                    <form action="{{ route('master-pekerjaans.update', $masterPekerjaan) }}" method="POST">
                        @csrf
                        @method('PATCH')

                        <div class="row g-4 mb-4">
                            <!-- Kode Pekerjaan -->
                            <div class="col-md-6">
                                <label for="kode_pekerjaan" class="form-label fw-bold text-uppercase small text-muted">Kode Pekerjaan</label>
                                <input type="text" class="form-control @error('kode_pekerjaan') is-invalid @enderror" id="kode_pekerjaan" name="kode_pekerjaan" value="{{ old('kode_pekerjaan', $masterPekerjaan->kode_pekerjaan) }}" required>
                                @error('kode_pekerjaan')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <!-- project_id -->
                            <div class="col-md-6">
                                <label for="project_id" class="form-label fw-bold text-uppercase small text-muted">project_id</label>
                                <input type="text" class="form-control @error('project_id') is-invalid @enderror" id="project_id" name="project_id" value="{{ old('project_id', $masterPekerjaan->project_id) }}" required>
                                @error('project_id')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <!-- Nama Pekerjaan -->
                            <div class="col-md-12">
                                <label for="nama_pekerjaan" class="form-label fw-bold text-uppercase small text-muted">Nama Pekerjaan</label>
                                <input type="text" class="form-control @error('nama_pekerjaan') is-invalid @enderror" id="nama_pekerjaan" name="nama_pekerjaan" value="{{ old('nama_pekerjaan', $masterPekerjaan->nama_pekerjaan) }}" required>
                                @error('nama_pekerjaan')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <!-- Keterangan -->
                            <div class="col-md-12">
                                <label for="keterangan" class="form-label fw-bold text-uppercase small text-muted">Keterangan (Opsional)</label>
                                <textarea class="form-control @error('keterangan') is-invalid @enderror" id="keterangan" name="keterangan" rows="3">{{ old('keterangan', $masterPekerjaan->keterangan) }}</textarea>
                                @error('keterangan')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>

                        <div class="d-flex justify-content-end gap-3 border-top pt-4">
                            <a href="{{ route('master-pekerjaans.show', $masterPekerjaan) }}" class="btn btn-light fw-bold text-uppercase px-4">Batal</a>
                            <button type="submit" class="btn btn-warning fw-bold text-uppercase px-4 text-dark">
                                SIMPAN PERUBAHAN 💾
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</x-app-layout>
