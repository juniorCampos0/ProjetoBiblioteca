<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="#" class="brand-link">
        <g:img dir="img" file="logo.png" alt="Library Logo" class="brand-image img-circle elevation-3" style="opacity: .8"/>
        <span class="brand-text font-weight-light">Library</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <li class="nav-item">
                    <g:if test="${ user == null}">
                        <a href="${g.createLink(controller:"login", action:"auth")}" class="nav-link">
                            <i class="fas fa-user nav-icon"></i>
                            <p>Login</p>
                        </a>
                    </g:if>
                    <g:else>
                        <a href="${g.createLink(controller:"userLog", action:"home")}" class="nav-link">
                            <i class="fas fa-user nav-icon"></i>
                            <p>${user.nome}</p>
                        </a>

                    </g:else>

                </li>
            </ul>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
                <li class="nav-item">
                    <a href="${g.createLink(controller:'book', action: 'bookList')}" class="nav-link">
                        <i class="nav-icon fas fa-book"></i>
                        <p>
                            Books
                            <span class="right badge badge-danger">New</span>
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${g.createLink(controller: 'author', action: 'authorList')}" class="nav-link">
                        <i class="nav-icon fas fa-users"></i>
                        <p>
                            Authors
                        </p>
                    </a>
                </li>
                <li class="nav-item has-treeview">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-book-open"></i>
                        <p>
                            Loans
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    %{--						Posso adicionar uma lista dropdown dos livros do usuário aqui--}%
                    <ul class="nav nav-treeview">
                        <g:each in="${lendings}" var="book">
                            <li class="nav-item">
                                <a href="${g.createLink(controller: 'book', action: "bookView", params: [idBookSearched: book.id] )}">
                                    <i class=" nav-icon fas fa-book"></i>
                                    <p>${book.title}</p>
                                </a>
                            </li>
                        </g:each>
                    </ul>
                    <a href="${g.createLink(controller: 'userLog', action: 'create')}">Mammia</a>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>