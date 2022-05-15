using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.Mvc;

namespace Pismovoditel.Logic
{
    public static class Helpers
    {
        public static MvcHtmlString DisplayForNull<TModel, TValue>(this HtmlHelper<TModel> helper, Expression<Func<TModel, TValue>> expression)
        {
            var metaData = ModelMetadata.FromLambdaExpression(expression, helper.ViewData);

            string valuetodisplay = string.Empty;

            if (metaData.Model != null)
            {
                if (metaData.DisplayFormatString != null)
                {
                    valuetodisplay = string.Format(metaData.DisplayFormatString, metaData.Model);

                }
                else
                {
                    valuetodisplay = metaData.Model.ToString();

                }

            }
            else
            {
                valuetodisplay = "не определено";

            }

            return MvcHtmlString.Create(valuetodisplay);

        }
    }
}