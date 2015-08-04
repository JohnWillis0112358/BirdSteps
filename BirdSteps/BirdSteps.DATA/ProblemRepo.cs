using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BirdSteps.MODELS;

namespace BirdSteps.DATA
{
    public class ProblemRepo
    {
        public List<BirdQ> GetQuestions()
        {
            var birdQuestions = new List<BirdQ>();
            using (SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["BirdSteps"].ConnectionString))
            {
                var cmd = new SqlCommand("GetQuestions", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cn.Open();
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        var temp = new BirdQ();
                        temp.QuestionID = dr.GetInt32(0);
                        temp.Question = dr.GetString(1);
                        birdQuestions.Add(temp);
                    }
                }
            }
            return birdQuestions;
        }

        public List<BirdA> GetAnswers(BirdQ question)
        {
            var birdAnswers = new List<BirdA>();
            using (SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["BirdSteps"].ConnectionString))
            {
                var cmd = new SqlCommand("GetAnswers", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@QuestionID", question.QuestionID);

                cn.Open();
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        var temp = new BirdA();
                        temp.AnswerID = dr.GetInt32(0);
                        temp.Answer = dr.GetString(1);
                        temp.QuestionID = dr.GetInt32(2);
                        temp.IsCorrect = dr.GetInt32(3);
                        birdAnswers.Add(temp);
                    }  
                }
            }
            return birdAnswers;
        }
    }
}
