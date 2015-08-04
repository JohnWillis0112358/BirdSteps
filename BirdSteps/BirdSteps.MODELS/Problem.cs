using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BirdSteps.MODELS
{
    public class Problem
    {
        public BirdQ Question { get; set; }
        public List<BirdA> Answers { get; set; }
    }
}
