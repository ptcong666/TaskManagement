<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Task list</title>
    <link rel="stylesheet" type="text/css" href="resources/styles/tasks.css"
          media="screen" />
    <script src="resources/scripts/jquery-2.0.3.js"></script>
    <script src="resources/scripts/jquery-tmpl.js"></script>
</head>
<body>
<header>
    <span>Task list</span>
</header>
<main>
    <section id="taskCreation" class="not">
        <form>
            <div>
                <label>Task</label> <input type="text" required="required"
                                           name="task" class="large" placeholder="Breakfast at Tiffanys" />
            </div>
            <div>
                <label>Required by</label> <input type="date" required="required"
                                                  name="requiredBy" />
            </div>
            <div>
                <label>Category</label> <select name="category">
                <option value="Personal">Personal</option>
                <option value="Work">Work</option>
            </select>
            </div>
            <nav>
                <a href="#" id="saveTask">Save task</a>
                <a href="#">Clear task</a>
            </nav>
        </form>
    </section>
    <section>
        <table id="tblTasks">
            <colgroup>
                <col width="40%">
                <col width="15%">
                <col width="15%">
                <col width="30%">
            </colgroup>
            <thead>
            <tr>
                <th>Name</th>
                <th>Due</th>
                <th>Category</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
        <nav>
            <a href="#" id="btnAddTask">Add task</a>
        </nav>
    </section>
</main>
<footer>You have 3 tasks</footer>
</body>
<script>
    $(document).ready(function() {
        $('[required="required"]').prev('label').append( '<span>*</span>').children( 'span').addClass('required');
        $('tbody tr:even').addClass('even');

        $('#btnAddTask').click(function(evt) {
            evt.preventDefault();
            $('#taskCreation').removeClass('not');
        });

        $('tbody tr').click(function(evt) {
            $(evt.target).closest('td').siblings().andSelf().toggleClass('rowHighlight');
        });

        $('#tblTasks tbody').on('click', '.deleteRow', function(evt) {
            evt.preventDefault();
            $(evt.target).parents('tr').remove();
        });

        $('#saveTask').click(function(evt) {
            evt.preventDefault();
            var task = $('form').toObject();
            $('#taskRow').tmpl(task).appendTo($('#tblTasks tbody'));
        });


    });


    (function($) {
        $.fn.extend({
            toObject: function() {
                var result = {}
                $.each(this.serializeArray(), function(i, v) {
                    result[v.name] = v.value;
                });
                return result;
            },
            fromObject: function(obj) {
                $.each(this.find(':input'), function(i,v) {
                    var name = $(v).attr('name');
                    if (obj[name]) {
                        $(v).val(obj[name]);
                    } else {
                        $(v).val('');
                    }
                });
            }
        });
    })(jQuery);

</script>

<script id="taskRow" type="text/x-jQuery-tmpl">
<tr>
	<td>${task}</td>
	<td><time datetime="${requiredBy}"> ${requiredBy}</time></td>
	<td>${category}</td>
	<td>
		<nav>
			<a href="#">Edit</a>
			<a href="#">Complete</a>
			<a href="#" class="deleteRow">Delete</a>
		</nav>
	</td>
</tr>
</script>

</html>

