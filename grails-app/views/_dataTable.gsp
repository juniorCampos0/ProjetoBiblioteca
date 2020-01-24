<table id="example2" class="table table-bordered table-hover">
    <thead>
    <tr>
        <th>Title</th>
        <th>Subtitle</th>
        <th>Labels</th>
        <th>Authors</th>
        <th>Avaliable</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${books}" var="book">
        <tr>
            <td><a href="${g.createLink(controller: 'book', action: 'bookView', params: [idBookSearched: book?.id])}">${book?.title}</a></td>
            <td>${book?.subtitle}</td>
            <td>
                <g:each in="${book?.labels}" var="label">
                    ${label?.tag}
                </g:each>
            </td>
            <td>
                <g:each in="${book?.authors}" var="author">
                    ${author?.fullName}
                </g:each>
            </td>
            <td>
                <g:if test="${book?.available == null | book?.available}">Yes</g:if><g:else>No</g:else></li>
            </td>
        </tr>
    </g:each>
    </tbody>
    <tfoot>
    <tr>
        <th>Title</th>
        <th>Subtitle</th>
        <th>Labels</th>
        <th>Authors</th>
        <th>Avaliable</th>
    </tr>
    </tfoot>
</table>