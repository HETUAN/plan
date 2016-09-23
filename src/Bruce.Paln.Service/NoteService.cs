using Bruce.Paln.Entity;
using Bruce.Paln.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bruce.Paln.Service
{
    public class NoteService
    {
        private readonly NoteRepository _repository;
        public NoteService()
        {
            _repository = new NoteRepository();
        }


        public NoteEntity GetMode(int Id)
        {
            return _repository.GetModel(Id);
        }

        public List<NoteEntity> GetList(int UserId)
        {
            return _repository.GetList(UserId);
        }

        public int Insert(NoteEntity model)
        {
            return _repository.Insert(model);
        }

        public int Update(NoteEntity model)
        {
            return _repository.Update(model);
        }

        public int Delete(int id)
        {
            return _repository.Delete(id);
        }
    }
}
