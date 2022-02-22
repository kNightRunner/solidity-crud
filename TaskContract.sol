// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.6;

contract TaskContract{

    uint nextId;
    
    struct Task {
        uint id;
        string name;
        string description;
    }

    Task[] task;
    function createTask(string memory _name, string memory _description) public{
        task.push(Task(nextId, _name, _description));
        nextId++;
    }

    function findIndex(uint _id) internal view returns (uint){
        for (uint i=0;i< task.length;i++){
            if (task[i].id == _id){
                return i;
            }
        }
        revert('Task not found');
    }

    function readTask(uint _id) public view returns (uint, string memory, string memory){
        uint index = findIndex(_id);
        return(task[index].id, task[index].name, task[index].description);
    }

    function updateTask (uint _id, string memory _name, string memory _description)public {
        uint index = findIndex(_id);
        task[index].name = _name;
        task[index].description = _description;
    }

    function deleteTask(uint _id) public{
        uint index = findIndex(_id);
        delete task[index];
    }

}
