<div class="text-center bg-red disabled color-palette" style="margin-top: 20px;"><h3> Resumen de pago </h3></div>

<div class="col-xs">
    <div class="alert alert-warning" id='mensaje-pago' style='display: none;'> 
    </div>
    
    <div class="table-responsive">
        <table class="table" id="resumen-pago">
            <thead>
                <th>Nombre del atleta</th>
                <th>Tarifa</th>
            </thead>

            <tbody>
                
            </tbody>
            <tfoot>
                <tr>
                    <td class="text-right"><strong>Subtotal:</strong></td>
                    <td><span id="academia_subtotal"></span></td>
                </tr>
                <tr>
                    <td class="text-right"><strong>Descuento:</strong></td>
                    <td><span id="academia_descuento"></span></td>
                </tr>
                <tr>
                    <td class="text-right"><strong>Total:</strong></td>
                    <td><span id="academia_total"></span></td>
                </tr>
            </tfoot>
        </table>
    </div>
    
   
    @include('adminlte::layouts.datos_pago')
    
</div>