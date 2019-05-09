<div class="col-lg-3 col-md-3 col-sm-12">
    <select class="form-control input-md" id="select_dupla_1">
        <option value="0">Seleccionar jugador 1</option>
    </select>
</div>

<div class="col-lg-3 col-md-3 col-sm-12">
    <select class="form-control input-md" id="select_dupla_2">
        <option value="0">Seleccionar jugador 2</option>
    </select>
</div>

<div class="col-lg-3 col-md-3 col-sm-12">
    <select class="form-control input-md" id="select_categoria">
        <option value="0">Seleccionar categoría</option>
        @foreach($categorias AS $key => $categoria)
            <option value="{{ $categoria->id }}">{{ $categoria->anyo_inicio }} - {{ $categoria->anyo_fin }}</option>
        @endforeach
    </select>
</div>

<div class="col-lg-3 col-md-3 col-sm-12">
    <button type="button" class="btn btn-primary btn-md btn-block" onclick="inscribir_dupla();"><i class="fa fa-plus"></i> Inscribir dupla </button>
</div>

<div class="col-lg-12 col-md-12 col-sm-12" style="padding-top: 20px;">
    <div class="table-responsive">
        <table id="lista-duplas" class="table table-bordered" style="font-size: 11px;">
            <thead>
                <th>Jugador 1</th>
                <th>Jugador 2</th>
                <th>Categoria</th>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
</div>