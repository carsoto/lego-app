<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

        <!-- Sidebar user panel (optional) -->
        @if (! Auth::guest())
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="{{ Gravatar::get($user->email) }}" class="img-circle" alt="User Image" />
                </div>
                <div class="pull-left info">
                    <p>{{ Auth::user()->name }}</p>
                    <!-- Status -->
                    <!-- <a href="#"><i class="fa fa-circle text-success"></i> {{ trans('adminlte_lang::message.online') }}</a> -->
                    <i class="fa fa-sign-out"></i><a href="{{ url('/logout') }}" onclick="event.preventDefault();
                                                                document.getElementById('logout-form-2').submit();">
                                                                {{ trans('adminlte_lang::message.signout') }}
                    </a>

                    <form id="logout-form-2" action="{{ url('/logout') }}" method="POST" style="display: none;">
                        {{ csrf_field() }}
                        <input type="submit" value="logout" style="display: none;">
                    </form>
                </div>
            </div>
        @endif

        <!-- search form (Optional) -->
        <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="{{ trans('adminlte_lang::message.search') }}..."/>
              <span class="input-group-btn">
                <button type='submit' name='search' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
              </span>
            </div>
        </form>
        <!-- /.search form -->

        <!-- Sidebar Menu -->
        <ul class="sidebar-menu">
            <!--<li class="header">{{ trans('adminlte_lang::message.header') }}</li>-->
            <!-- Optionally, you can add icons to the links -->
            <li class="active"><a href="{{ url('home') }}"><i class='fa fa-home'></i> <span>{{ trans('adminlte_lang::message.home') }}</span></a></li>
            @if(Auth::user()->hasRole('admin'))
                <li>
                    <a href="#"><span>Academia</span> <i class="fa fa-angle-left pull-right"></i></a>
                    <ul class="treeview-menu">
                        <li><a href="{{ route('academia.prueba.dashboard') }}">Clases de prueba</a></li>
                        <li><a href="{{ route('academia.dashboard') }}">Regulares</a></li>
                        <li><a href="{{ route('academia.asistencia') }}">Asistencia</a></li>
                    </ul>
                </li>

                <li><a href="{{ route('alquiler.dashboard') }}"><span>Alquileres</span></a></li>
                <li><a href="{{ route('vacacional.dashboard') }}"><span>Vacacional</span></a></li>
                <li><a href="{{ route('campamento.dashboard') }}"><span>Campamento</span></a></li>
                <li><a href="{{ route('workshop.dashboard') }}"><span>Workshop</span></a></li>

                <li><a href="{{ route('usuarios.index') }}"><i class='fa fa-user'></i><span>Usuarios</span></a></li>
            @elseif(Auth::user()->hasRole('profesor'))
                <li>
                    <a href="#"><span>Academia</span> <i class="fa fa-angle-left pull-right"></i></a>
                    <ul class="treeview-menu">
                        <li><a href="{{ route('academia.prueba.dashboard') }}">Clases de prueba</a></li>
                        <li><a href="{{ route('academia.dashboard') }}">Regulares</a></li>
                        <li><a href="{{ route('academia.asistencia') }}">Asistencia</a></li>
                    </ul>
                </li>
                <li><a href="{{ route('vacacional.dashboard') }}"><span>Vacacional</span></a></li>
                <li><a href="{{ route('campamento.dashboard') }}"><span>Campamento</span></a></li>
            @endif
            <!--<li><a href="#"><i class='fa fa-link'></i> <span>{{ trans('adminlte_lang::message.anotherlink') }}</span></a></li>
            <li class="treeview">
                <a href="#"><i class='fa fa-link'></i> <span>{{ trans('adminlte_lang::message.multilevel') }}</span> <i class="fa fa-angle-left pull-right"></i></a>
                <ul class="treeview-menu">
                    <li><a href="#">{{ trans('adminlte_lang::message.linklevel2') }}</a></li>
                    <li><a href="#">{{ trans('adminlte_lang::message.linklevel2') }}</a></li>
                </ul>
            </li>-->

        </ul><!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
</aside>
