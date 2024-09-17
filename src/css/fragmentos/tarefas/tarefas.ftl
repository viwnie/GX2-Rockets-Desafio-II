<div class="TarefasContainer">
  <div class="header rounded p-3 mb-4">
    <h2>Adicionar Tarefa</h2>
    <div class="row mb-3">
      <div class="col-lg-4 col-12 mb-2">
        <input type="text" id="myInput" class="form-control" placeholder="Adicionar nova tarefa">
      </div>
      <div class="col-lg-3 col-12 mb-2">
        <select id="newTaskStatus" class="custom-select">
          <option value="pending">Pendente</option>
          <option value="inProgress">Em Progresso</option>
          <option value="completed">Concluída</option>
        </select>
      </div>
      <div class="col-lg-3 col-12 mb-2">
        <input type="date" id="newTaskDate" class="form-control">
      </div>
      <div class="col-lg-2 col-12">
        <button id="addTaskButton" class="btn btn-primary btn-block">Adicionar</button>
      </div>
    </div>
  </div>
	<div class="bodyTarefa rounded p-3">
  <div class="filters mb-3 d-flex justify-content-between align-items-center flex-wrap">
    <div class="d-flex align-items-center mt-2">
      <label for="filterStatus" class="mr-2">Status</label>
      <select id="filterStatus" class="custom-select">
        <option value="all">Todas</option>
        <option value="pending">Pendentes</option>
        <option value="inProgress">Em Progresso</option>
        <option value="completed">Concluídas</option>
      </select>
    </div>

    <div class="d-flex align-items-center mt-2">
      <label for="filterDate" class="mr-2">Data</label>
      <input type="date" id="filterDate" class="form-control">
    </div>
  </div>

  <ul id="listaTarefas" class="list-group">
    <!-- Tarefas serão adicionadas aqui -->
  </ul>
	</div>
</div>



<#--  Liferay script  -->
Liferay.on('allPortletsReady', function() {
  let tasks = [
    { id: 1, text: 'Comprar dollar', status: 'pending', dueDate: '2024-09-10' },
    { id: 2, text: 'Comprar Yien', status: 'completed', dueDate: '2024-09-09' },
    { id: 3, text: 'Vender Btc', status: 'inProgress', dueDate: '2024-09-11' }
  ];

  const ul = fragmentElement.querySelector('#listaTarefas');
  const addButton = fragmentElement.querySelector('#addTaskButton');
  const statusFilter = fragmentElement.querySelector('#filterStatus');
  const dateFilter = fragmentElement.querySelector('#filterDate');
  const inputField = fragmentElement.querySelector("#myInput");
  const statusField = fragmentElement.querySelector("#newTaskStatus");
  const dateField = fragmentElement.querySelector("#newTaskDate");

  function renderTasks(filteredTasks = tasks) {
    ul.innerHTML = '';
    filteredTasks.forEach(task => {
      const li = document.createElement("li");
      li.className = `list-group-item mb-1 d-flex justify-content-between align-items-center ${task.status}`;
      li.dataset.id = task.id;

      const taskText = document.createElement("span");
      taskText.className = "objetivo";
      taskText.textContent = task.text;
      taskText.addEventListener('dblclick', () => enableEditing(taskText, task.id));
      taskText.addEventListener('touchstart', () => enableEditing(taskText, task.id));

      const taskDate = document.createElement("span");
      taskDate.className = 'badge badge-secondary';
      taskDate.textContent = task.dueDate;

      const closeBtn = document.createElement("span");
      closeBtn.className = 'close';
      closeBtn.textContent = '\u00D7';
      closeBtn.onclick = () => removeTask(task.id);

      li.append(taskText, taskDate, closeBtn);
      ul.appendChild(li);
    });
  }

  function enableEditing(taskText, taskId) {
    const input = document.createElement('input');
    input.type = 'text';
    input.value = taskText.textContent;
    input.className = 'form-control';
    taskText.replaceWith(input);
    input.focus();
    input.addEventListener('blur', () => saveEdit(input, taskId));
    input.addEventListener('keydown', (e) => {
      if (e.key === 'Enter') saveEdit(input, taskId);
    });
  }

  function saveEdit(input, taskId) {
    tasks = tasks.map(task => task.id === taskId ? { ...task, text: input.value } : task);
    renderTasks();
  }

  function toggleTaskCompletion(ev) {
    if (ev.target.tagName === 'LI') {
      const taskId = parseInt(ev.target.dataset.id);
      tasks = tasks.map(task => {
        if (task.id === taskId) {
          task.status = task.status === 'completed' ? 'pending' : task.status === 'pending' ? 'inProgress' : 'completed';
        }
        return task;
      });
      renderTasks();
    }
  }

  function filterTasks() {
    const status = statusFilter.value;
    const date = dateFilter.value;
    const filteredTasks = tasks.filter(task => 
      (status === 'all' || task.status === status) && (!date || task.dueDate === date)
    );
    renderTasks(filteredTasks);
  }

  function newElement() {
    const inputValue = inputField.value;
    const statusValue = statusField.value || 'pending';
    const dateValue = dateField.value || new Date().toISOString().split('T')[0];

    if (!inputValue) {
      alert("Você precisa escrever algo!");
      return;
    }

    tasks.push({
      id: tasks.length + 1,
      text: inputValue,
      status: statusValue,
      dueDate: dateValue
    });

    inputField.value = '';
    statusField.value = 'pending';
    dateField.value = '';
    renderTasks();
  }

  function removeTask(id) {
    tasks = tasks.filter(task => task.id !== id);
    renderTasks();
  }

  addButton.addEventListener('click', newElement);
  statusFilter.addEventListener("change", filterTasks);
  dateFilter.addEventListener("change", filterTasks);
  ul.addEventListener('click', toggleTaskCompletion);

  renderTasks();
});