//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Todos {

    //todo listimiz için bir yapı oluşturduk

    struct Todo {
        string text; // string veri tipi ile todo'da yapılacak görevleri tutucaz.
        bool completed; //boolean veri tipimiz ile todo'da görevlerin bitip bitmediğini döndürücez.
    }

// Todo yapısını public olarak işaretleyip bir array yaptık.

Todo[] public todos;
//todo listimize veri eklemek için bir fonksiyon oluşturduk
function create(string calldata _text) public {
    //key value mapping kullanarak Todo struct'a fonksiyondan aldığımız inputu(_text) yazdırdık.
    //yeni oluşturulan görev tamamlanmadığı için false olarak gönderdik.
    
    todos.push(Todo({text: _text, completed: false}));

}
//Bu fonksiyona aslında ihtiyacımız yok çünkü solidity otomatik olarak oluşturuyor.
function get(uint256 _index) public view returns(string memory text, bool completed) {
    Todo storage todo = todos[_index];
    return (todo.text, todo.completed);
}

//görevimizi güncellemek için bir fonksiyon
function updateText(uint256 _index, string calldata _text) public {
    Todo storage todo = todos[_index];
    todo.text = _text;
}

//tamamlandı olarak işaretlemek için bir fonksiyon
function toggleCompleted(uint256 _index) public {
    Todo storage todo = todos[_index];
    todo.completed = !todo.completed;
}

}

