using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BirdSteps.BLL;

namespace BirdConsole
{
    class Program
    {
        static void Main(string[] args)
        {
            var birdOperations = new ProblemOperations();
            var problemlist = birdOperations.GetProblemList();

            foreach (var problem in problemlist)
            {
                Console.WriteLine(problem.Question.Question);
                foreach (var answer in problem.Answers)
                {
                    Console.WriteLine(answer.Answer);
                }
                Console.ReadLine();
            }
            Console.WriteLine("\nComplete!\n");
            Console.ReadLine();
        }
    }
}
