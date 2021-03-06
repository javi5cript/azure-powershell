// <auto-generated>
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for
// license information.
//
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is
// regenerated.
// </auto-generated>

namespace Microsoft.Azure.PowerShell.Cmdlets.Peering.Models
{
    using Newtonsoft.Json;
    using System.Linq;

    /// <summary>
    /// The contact detail class.
    /// </summary>
    public partial class PSContactDetail
    {
        /// <summary>
        /// Initializes a new instance of the PSContactDetail class.
        /// </summary>
        public PSContactDetail()
        {
            CustomInit();
        }

        /// <summary>
        /// Initializes a new instance of the PSContactDetail class.
        /// </summary>
        /// <param name="role">The role of the contact. Possible values
        /// include: 'Noc', 'Policy', 'Technical', 'Service', 'Other'</param>
        /// <param name="email">The e-mail address of the contact.</param>
        /// <param name="phone">The phone number of the contact.</param>
        public PSContactDetail(string role = default(string), string email = default(string), string phone = default(string))
        {
            Role = role;
            Email = email;
            Phone = phone;
            CustomInit();
        }

        /// <summary>
        /// An initialization method that performs custom operations like setting defaults
        /// </summary>
        partial void CustomInit();

        /// <summary>
        /// Gets or sets the role of the contact. Possible values include:
        /// 'Noc', 'Policy', 'Technical', 'Service', 'Other'
        /// </summary>
        [JsonProperty(PropertyName = "role")]
        public string Role { get; set; }

        /// <summary>
        /// Gets or sets the e-mail address of the contact.
        /// </summary>
        [JsonProperty(PropertyName = "email")]
        public string Email { get; set; }

        /// <summary>
        /// Gets or sets the phone number of the contact.
        /// </summary>
        [JsonProperty(PropertyName = "phone")]
        public string Phone { get; set; }

    }
}
