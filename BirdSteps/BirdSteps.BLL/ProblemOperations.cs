using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Permissions;
using System.Text;
using System.Threading.Tasks;
using BirdSteps.DATA;
using BirdSteps.MODELS;

namespace BirdSteps.BLL
{
    public class ProblemOperations
    {
        private ProblemRepo _problemRepo = new ProblemRepo();

        public List<Problem> GetProblemList()
        {
            var problemList = new List<Problem>();
            var questions = new List<BirdQ>();
            questions =_problemRepo.GetQuestions();
            foreach (var question in questions)
            {
                var problem = new Problem();
                problem.Question = question;
                problem.Answers =_problemRepo.GetAnswers(question);
                problemList.Add(problem);
            }

            return problemList;
        }
    }
}
