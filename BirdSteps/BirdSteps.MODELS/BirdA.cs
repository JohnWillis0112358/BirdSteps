using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BirdSteps.MODELS
{
    public class BirdA
    {
        public int QuestionID { get; set; }
        public int AnswerID { get; set; }
        public string Answer { get; set; }
        public int IsCorrect { get; set; }
    }
}
